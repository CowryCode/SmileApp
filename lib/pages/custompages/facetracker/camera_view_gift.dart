import 'dart:async';
import 'dart:io';

import 'package:SmileApp/apis/models/moodmodel.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/smile_game_view.dart';
import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/countdowntimer.dart';
import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/glassmorphicReadMessage.dart';
import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/glassmorphicsmilegramdisplay.dart';
import 'package:SmileApp/statemanagement/notifiers/SGmessageModel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:flutter/services.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:wakelock/wakelock.dart';
import '../../../main.dart';

enum ScreenMode { liveFeed, gallery }

enum Actions { Increment }

late String likes, gotpoints, popularity, totalPoints, details, pac, date;

class CameraViewGift extends StatefulWidget {
  CameraViewGift(
      {Key? key,
      required this.title,
      //TODO: COMMENTED OUT TODAY 20-09-2022
      // required this.customPaint,
      // required this.text,
      required this.onImage,
      this.onScreenModeChanged,
      this.initialDirection = CameraLensDirection.front,
      this.readmessage = false})
      : super(key: key);

  final String title;

  //TODO: COMMENTED OUT TODAY 20-09-2022
  //final CustomPaint customPaint;
  // final String text;
  final Function(InputImage inputImage) onImage;

  // final Function(ScreenMode mode) onScreenModeChanged;
  Function(ScreenMode mode)? onScreenModeChanged;
  final CameraLensDirection initialDirection;

  // Added this for my study logic
  final bool readmessage;

  @override
  _CameraViewGiftState createState() => _CameraViewGiftState();
}
//TODO: Read and Send Smile Pack with a smile
//TODO: While smiling and all the text have been revealed, the Face of the sender shows (and gets deleted immediately)

class _CameraViewGiftState extends State<CameraViewGift> {
  ScreenMode _mode = ScreenMode.liveFeed;


  CameraController? _controller;

  int _cameraIndex = 1;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;
  final bool _allowPicker = true;
  bool _changingCameraLens = false;


  late int _tokenArrayLength;

  // int _value = 0;
  // bool _activated = false;
  // int _activation_index = -1;
  final Duration timerTastoPremuto = Duration(seconds: 20);

  //Todo: Add real value
  int highestpoint = 20;

  int progressBarvalue = 20;

  // bool smilestartCountdown = false;

  // VARIABLES FOR THE MAP
  // late List<Model> data;
  late MapShapeSource sublayerDataSource;
  late MapShapeSource shapeDataSource;

  @override
  void initState() {
    super.initState();
    Wakelock.enable();

        try {
          if (cameras.any(
                (element) =>
            element.lensDirection == widget.initialDirection &&
                element.sensorOrientation == 90,
          )) {
            _cameraIndex = cameras.indexOf(
              cameras.firstWhere((element) =>
              element.lensDirection == widget.initialDirection &&
                  element.sensorOrientation == 90),
            );
          } else {
            _cameraIndex = cameras.indexOf(
              cameras.firstWhere(
                    (element) => element.lensDirection == widget.initialDirection,
              ),
            );
          }

          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

          _startLiveFeed();

        } catch (e) {
          print("Error : ${e.toString()}");
        }

  }


  void refreshCamera() {
    try {

      if (cameras.any(
        (element) =>
            element.lensDirection == widget.initialDirection &&
            element.sensorOrientation == 90,
      )) {
        _cameraIndex = cameras.indexOf(
          cameras.firstWhere((element) =>
              element.lensDirection == widget.initialDirection &&
              element.sensorOrientation == 90),
        );
      } else {
        _cameraIndex = cameras.indexOf(
          cameras.firstWhere(
            (element) => element.lensDirection == widget.initialDirection,
          ),
        );
      }
      _startLiveFeed();
      // SET PREFERRED ORIENTATION
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    } catch (e) {
      debugPrint("CAMERA ERROR : ${e.toString()}");
    }
  }

  //

  @override
  void dispose() {
    _stopLiveFeed();
    Wakelock.disable();
    super.dispose();
  }
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      barrierDismissible: true,
      // set to false if you want to force a rating
      builder: (context) => _showRatingAlert(context, justreadmessage: widget.readmessage),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                // set to false if you want to force a rating
                builder: (context) => _showRatingAlert(context,
                    justreadmessage: widget.readmessage),
              );
              //Navigator.of(context).popAndPushNamed('/home');
            },
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(widget.title),
        ),
        body: _body(),
        // floatingActionButton: _floatingActionButton(), // I removed the floating button
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // I removed the floating Button
      ),
    );
  }

  // Widget? _floatingActionButton() {
  //   if (_mode == ScreenMode.gallery) return null;
  //   if (cameras.length == 1) return null;
  //   return SizedBox(
  //       height: 70.0,
  //       width: 70.0,
  //       child: FloatingActionButton(
  //         child: Icon(
  //           Platform.isIOS
  //               ? Icons.flip_camera_ios_outlined
  //               : Icons.flip_camera_android_outlined,
  //           size: 40,
  //         ),
  //         onPressed: _switchLiveCamera,
  //       ));
  // }

  // DO NOT DELETE
  // Widget _body() { // the Original Code
  //   Widget body;
  //   if (_mode == ScreenMode.liveFeed) {
  //     body = _liveFeedBody();
  //   } else {
  //     body = _galleryBody();
  //   }
  //   return body;
  // }
  Widget _body() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ValueListenableBuilder(
            valueListenable: smileAppValueNotifier.value.showCountDown,
            builder: (context, bool value, child) {
              return _cameraDisplay(smilestartCountdown: value);
            },
          ),
          SizedBox(
            height: 20,
          ),
          ValueListenableBuilder(
            // valueListenable: counterNotifier,
            valueListenable: smileAppValueNotifier.value.showCountDown,
            builder: (context, value, child) {
              if (value == false && !widget.readmessage) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (value == false && !widget.readmessage) ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary),
                      child: const Text(
                        'Refresh',
                      ),
                      onPressed: () {
                        refreshCamera(); // Refresh
                      },
                    ) : SizedBox( height: 1,),
                    SizedBox(
                      width: 3,
                    ),
                    (value == false) ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary),
                      child: const Text(
                        'Done',
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          // set to false if you want to force a rating
                          builder: (context) =>
                              _showRatingAlert(context, justreadmessage: true),
                        );
                      },
                    ) : SizedBox( height: 1,),
                  ],
                );
              } else {
                return SizedBox(
                  height: 1,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _liveFeedBody() {
    if (_controller != null) {
      if (_controller?.value != null) {
        if (_controller?.value.isInitialized == false) {
          return Container();
        }
      } else {
        return Container();
      }
    } else {
      return Container();
    }


    final size = MediaQuery.of(context).size;
    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * _controller!.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Transform.scale(
            scale: scale,
            child: Center(
              child: _changingCameraLens
                  ? Center(
                      child: const Text('Changing camera lens'),
                    )
                  : CameraPreview(_controller!),
            ),
          ),
          //TODO: COMMENTED OUT TODAY 20-09-2022
          //if (widget.customPaint != null) widget.customPaint,
          Positioned(
            bottom: 100,
            left: 50,
            right: 50,
            child: Slider(
              value: zoomLevel,
              min: minZoomLevel,
              max: maxZoomLevel,
              onChanged: (newSliderValue) {
                setState(() {
                  zoomLevel = newSliderValue;
                  _controller!.setZoomLevel(zoomLevel);
                });
              },
              divisions: (maxZoomLevel - 1).toInt() < 1
                  ? null
                  : (maxZoomLevel - 1).toInt(),
            ),
          )
        ],
      ),
    );
  }

  void _switchScreenMode() {
    // _image = null;
    // if (_mode == ScreenMode.liveFeed) {
    //   _mode = ScreenMode.gallery;
    //   _stopLiveFeed();
    // } else {
    //   _mode = ScreenMode.liveFeed;
    //   _startLiveFeed();
    // }
    // if (widget.onScreenModeChanged != null) {
    //   widget.onScreenModeChanged!(_mode);
    // }
    // setState(() {});
  }

  Future _startLiveFeed() async {
    final camera = cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      // ResolutionPreset.high,
      ResolutionPreset.low,
      enableAudio: false,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.getMinZoomLevel().then((value) {
        zoomLevel = value;
        minZoomLevel = value;
      });
      _controller?.getMaxZoomLevel().then((value) {
        maxZoomLevel = value;
      });
      _controller?.startImageStream(_processCameraImage);
      setState(() {});
    });
  }

  Future _stopLiveFeed() async {
    //ORIGINAL
    // await _controller?.stopImageStream();
    // await _controller?.dispose();
    // _controller = null;

    if(_controller != null){
      if(_controller?.value.isInitialized == false){
        await _controller?.stopImageStream() ;
        await _controller?.dispose();
      }
    }
    _controller = null;
  }

  // Future _switchLiveCamera() async {
  //   setState(() => _changingCameraLens = true);
  //   _cameraIndex = (_cameraIndex + 1) % cameras.length;
  //
  //   await _stopLiveFeed();
  //   await _startLiveFeed();
  //   setState(() => _changingCameraLens = false);
  // }

  Future _processCameraImage(CameraImage image) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());

    final camera = cameras[_cameraIndex];
    final imageRotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (imageRotation == null) return;

    final inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw);
    if (inputImageFormat == null) return;

    final planeData = image.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage =
        InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    widget.onImage(inputImage);
  }

  // MY CODE
  Widget _cameraDisplay({required bool smilestartCountdown}) {
    if (_controller != null) {
      if (_controller?.value != null) {
        if (_controller?.value.isInitialized == false) {
          // return Container();
          print("CONTROLLER  VALUE IS NOT INITIALIZED");
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
          );
        }
      } else {
        // return Container();
        print("CONTROLLER VALUE IS NULL");
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
        );
      }
    } else {
      // return Container();
      print("CONTROLLER IS NULL");
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
      );
    }
    // Old working code
    // if (_controller?.value.isInitialized == false) {
    //   return Container();
    // }

    final size = MediaQuery.of(context).size;
    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * _controller!.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    // added by me
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    // end of added by me
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          // USER IMAGE VIEW
          ValueListenableBuilder(
            valueListenable: smileAppValueNotifier.value.showCountDown,
            builder: (context, value, child) {
              if (_controller != null && value == false) {
              //  return Center(child: CameraPreview(_controller!));
                return Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        margin: EdgeInsets.only(left: 15.0),
                        child: CameraPreview(_controller!)
                    )
                );
              } else {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6);
              }
            },
          ),
          // COUNT DOWN TIMER
          ValueListenableBuilder(
            valueListenable: smileAppValueNotifier.value.showCountDown,
            builder: (context, value, child) {
              if (value == true) {
                return Center(child: CountdownTimer());
              } else {
                return SizedBox(
                  height: 3.0,
                );
              }
            },
          ),
          //SMILE GRAM OBJECT
          ValueListenableBuilder(
            valueListenable: smileAppValueNotifier.value.showCountDown,
            builder: (context, value, child) {
              if (value == false && !widget.readmessage) {
                return GlassmorphicSmilegramDisplay();
              } else {
                return SizedBox(
                  height: 3.0,
                );
              }
            },
          ),
          // SMILE GAME OBJECT
          ValueListenableBuilder(
            valueListenable: smileAppValueNotifier.value.showCountDown,
            builder: (context, value, child) {
              if (value == false && !widget.readmessage) {
                return Center(child: SmileGame());
              } else {
                return SizedBox(
                  height: 3.0,
                );
              }
            },
          ),
          // TRIBE MESSAGE READING OBJECT
          ValueListenableBuilder(
            valueListenable: smileAppValueNotifier.value.showCountDown,
            builder: (context, value, child) {
              if (value == false && widget.readmessage) {
                return GlassmorphicReadMessage();
              } else {
                return SizedBox(
                  height: 3.0,
                );
              }
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: ValueListenableBuilder(
              // valueListenable: counterNotifier,
              valueListenable: smileAppValueNotifier.value.deactivetSound,
              builder: (context, bool value, child) {
                return IconButton(
                    onPressed: () {
                      smileAppValueNotifier.updateSoundDeactivation(
                          deactivateSound: !value);
                    },
                    icon: Icon(
                      (value != true)
                          ? FontAwesomeIcons.volumeHigh
                          : FontAwesomeIcons.volumeOff,
                      color: Colors.green,
                    ));
              },
            ),
          ),
        ],
      ),
    );

  }

  ScaleAnimatedText scaleValue({required String val}) {
    return ScaleAnimatedText('$val',
        scalingFactor: 0.2,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontSize: 35.0,
        ));
  }

  Widget _giftAlert({required String message, required int amountWon}) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage('images/custom/giftopen.png'),
              fit: BoxFit.cover,
            )),
        child: Stack(
          children: <Widget>[
            Center(
              //  child: Text(' Congratulations! your won $_value points', style: TextStyle(color: Theme.of(context).colorScheme.secondary ),),
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 30.0, fontFamily: 'SF', color: Colors.red),
                child: Center(
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      ScaleAnimatedText('$amountWon points won!',
                          scalingFactor: 0.2, textAlign: TextAlign.center),
                      ScaleAnimatedText('$message !',
                          scalingFactor: 0.2, textAlign: TextAlign.center),
                      ScaleAnimatedText('$amountWon points won!',
                          scalingFactor: 0.2, textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget weatherMap() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: SfMaps(
        layers: <MapShapeLayer>[
          MapShapeLayer(
            source: shapeDataSource,
            sublayers: [
              MapShapeSublayer(
                source: sublayerDataSource,
              )
            ],
          ),
        ],
      ),
    );
  }

  RatingDialog _showRatingAlert(BuildContext context, {required bool justreadmessage}) {
    return RatingDialog(
      showCloseButton: false,
      initialRating: 0.0,
      starSize: 30.0,
      // your app's name?
      title: Text(
        'Rate Your Mood',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        (widget.readmessage == true)
            ? 'How happy does it feel to unlock your message with a smile?'
            : 'How happy does it feel to smile this long?',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      image: Image.asset(
        "assets/logo1.jpeg",
        width: 100,
        height: 100,
      ),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        MoodModel mood = smileAppValueNotifier.value.moodmodel.value;
        mood.captureMood(
            rating: response.rating.round(),
            countrycount: smileAppValueNotifier.getSmileDurationCounter());
        ApiAccess().saveMood(
            moodModel: mood,
            url: (widget.readmessage == true)
                ? Tribe_Mood_URL
                : SmileGram_Mood_URL);

        Navigator.of(context).popAndPushNamed(
          '/home',
        );
      },
      submitButtonTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.green),
    );
  }
}

// class Model {
//   const Model(this.state, this.storage);
//
//   final String state;
//   final String storage;
// }
