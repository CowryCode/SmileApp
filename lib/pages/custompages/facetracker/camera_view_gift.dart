import 'dart:async';

import 'package:SmileApp/apis/models/moodmodel.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/rating_view.dart';
import 'package:SmileApp/pages/custompages/SmilyRating/smile_game_view.dart';
import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/countdowntimer.dart';
import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/glassmorphicReadMessage.dart';
import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/glassmorphicsmilegramdisplay.dart';
import 'package:SmileApp/statemanagement/models/smilegamenotifiermodel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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


  CameraController? _controller; // Moved to centralized place on 13-12-2022


  int _cameraIndex = 1;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;
  final bool _allowPicker = true;
  bool _changingCameraLens = false;


  late int _tokenArrayLength;

  final Duration timerTastoPremuto = Duration(seconds: 20);



  // VARIABLES FOR THE MAP
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
          _startLiveFeed();
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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

  @override
  void dispose() {
    _stopLiveFeed();
    Wakelock.disable();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (
        await showDialog(
      context: context,
      barrierDismissible: true,
      // set to false if you want to force a rating
      builder: (context) => _showRatingAlert(context, justreadmessage: widget.readmessage),
      )) ?? false;

    return (
        await showDialog(
          context: context,
          barrierDismissible: true,
          // set to false if you want to force a rating
          builder: (context) => Dialog(child: RatingView(ratingonly: widget.readmessage,),),
        )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
   // WidgetsBinding.instance.addPostFrameCallback((_)=> refreshCamera());

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
                  builder: (context) => _showRatingAlert(context, justreadmessage: widget.readmessage),
              );
              // showDialog(
              //   context: context,
              //   barrierDismissible: true,
              //   builder: (context) => Dialog(child: RatingView(),),
              // );
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
                        // showDialog(
                        //   context: context,
                        //   barrierDismissible: true,
                        //   // set to false if you want to force a rating
                        //   builder: (context) =>
                        //       _showRatingAlert(context, justreadmessage: true),
                        // );
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          // set to false if you want to force a rating
                          builder: (context) => Dialog(child: RatingView(),),
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

  Future _startLiveFeed() async {
    print('STARTING LIVE FEED :::::::::::::');
    final camera = cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.low,
      enableAudio: false,
    );
    _controller?.initialize().then((_) {
      print('STARTING LIVE FEED_B :::::::::::::');
      if (!mounted) {
        print('STARTING LIVE FEED_C :::::::::::::');
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
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;

    // await _controller?.stopImageStream();
    // await _controller?.dispose();
    // _controller = null;
  }


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
          print("CONTROLLER  VALUE IS NOT INITIALIZED");
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
          );
        }
      } else {
        print("CONTROLLER VALUE IS NOT NULL");
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
        );
      }
     } else {
      print("CONTROLLER IS NULL");
      print("CONTROLLER IS NULL 1");

      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
      );
    }
    print("Built Completely ::::::");

    final size = MediaQuery.of(context).size;
    /* calculate scale depending on screen and camera ratios
     this is actually size.aspectRatio / (1 / camera.aspectRatio)
     because camera preview size is received as landscape
     but we're calculating for portrait orientation */
    var scale = size.aspectRatio * _controller!.value.aspectRatio;
    // var scale = size.aspectRatio * _controller!.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    // added by me
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
          //SOUND CONTROL
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
          // USER IMAGE VIEW
          ValueListenableBuilder(
            valueListenable: smileAppValueNotifier.value.showCountDown,
            builder: (context, value, child) {
             // if (_controller != null && value == false) {
              if (_controller != null && value == false) {
                return Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        margin: EdgeInsets.only(left: 15.0),
                       // child: CameraPreview(_controller!)
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
          // SHOW PROGRESS ALERT
          ValueListenableBuilder(
              valueListenable: smileGameNofitier,
              builder: (context, SmileGameVariables gamevariables, child) {
                // WE WANT THE ALERT TO SHOW AFTER 3 COUNTRIES ARE PAINTED
                if(gamevariables.targetCaught){
                  // return Dialog(
                  //   child: RatingView(),
                  // );
                  return SizedBox(
                    height: 3.0,
                  );
                }else{
                  return SizedBox(
                    height: 3.0,
                  );
                }
              }
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


  Widget _liveFeedBody() {
    //if (_controller != null) {
    if (_controller != null) {
      // if (_controller?.value != null) {
      if (_controller?.value != null) {
        // if (_controller?.value.isInitialized == false) {
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
    /* calculate scale depending on screen and camera ratios
       this is actually size.aspectRatio / (1 / camera.aspectRatio)
       because camera preview size is received as landscape
       but we're calculating for portrait orientation */
    var scale = size.aspectRatio * _controller!.value.aspectRatio;
    //var scale = size.aspectRatio * _controller!.value.aspectRatio;

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
              //  : CameraPreview(_controller!),
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
                  // _controller!.setZoomLevel(zoomLevel);
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
        mood.captureMood(rating: response.rating.round(), smileduration: smileGameNofitier.getSmileDurationInSecound());
        ApiAccess().saveMood(moodModel: mood, url: (widget.readmessage == true) ? Tribe_Mood_URL : SmileGram_Mood_URL);

        Navigator.of(context).popAndPushNamed('/home',);
      },
      submitButtonTextStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.green),
    );
  }

}
