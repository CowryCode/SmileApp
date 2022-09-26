import 'dart:async';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:camera/camera.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:SmileApp/pages/custompages/statemanagement/actions.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/pages/custompages/statemanagement/my_app_state.dart';
import 'package:flutter/services.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
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
      required this.text,
      required this.onImage,
      this.onScreenModeChanged,
      this.initialDirection = CameraLensDirection.back,
        this.readmessage = false})
      : super(key: key);

  final String title;
  //TODO: COMMENTED OUT TODAY 20-09-2022
  //final CustomPaint customPaint;
  final String text;
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
  // CameraController _controller;
  // File _image;
  // String _path;
  // ImagePicker _imagePicker;
  CameraController? _controller;
  File? _image;
  String? _path;
  ImagePicker? _imagePicker;
  int _cameraIndex = 0;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;
  final bool _allowPicker = true;
  bool _changingCameraLens = false;

  int _count = 0; // My Code
  String _msg = ""; // My Code
  String _fulltext =
      "I am a living testimony testimony that God is good"; // My Code
  int _tokenIndex = 0; // My Code
  var _tokenArray;

  late int _tokenArrayLength;



  int _value = 0;
  bool _activated = false;
  int _activation_index = -1;
  final Duration timerTastoPremuto = Duration(seconds: 20);
  //Todo: Add real value
  int highestpoint = 20;

  int progressBarvalue = 20;
  bool smilestartCountdown = true;


  // VARIABLES FOR THE MAP
  late List<Model> data;
  late MapShapeSource sublayerDataSource;
  late MapShapeSource shapeDataSource;


  @override
  void initState() {
    super.initState();
    try {
      _tokenArray = _fulltext.split(" ");

      _tokenArrayLength = _tokenArray.length;

      _imagePicker = ImagePicker();

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
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]);

      // SET DATA FOR MAP
     // GobeModel  gm = GobeModel();
      // data = gm.getProcessedcountries(userCountriesIndexString: "0,1,2,3")!;
      // print("Loaded Data : ${data}");
      data = <Model>[
        Model('Algeria', "Low"),
        Model('Nigeria', "High"),
        Model('Libya', "Low"),
        Model('Azerbaijan', "Low"),
        Model('Burkina Faso', "Low"),
        Model('Afghanistan', "Low"),
      ];

      shapeDataSource = MapShapeSource.asset(
        "assets/world_map.json",
        shapeDataField: 'continent',
      );

      sublayerDataSource = MapShapeSource.asset(
        "assets/world_map.json",
        shapeDataField: "admin",
        dataCount: data.length,
        primaryValueMapper: (int index) {
          return data[index].state;
        },
        shapeColorValueMapper: (int index) {
          return data[index].storage;
        },
        shapeColorMappers: [
          MapColorMapper(value: "Low", color: Colors.red),
          MapColorMapper(value: "High", color: Colors.green)
        ],
      );

    }catch(e){
      print("Error : ${e.toString()}");
    }
   // _randomize();
  }

  // Added this code on 21-08-2021 //

  void refreshCamera(){
    try {
      _tokenArray = _fulltext.split(" ");
      _tokenArrayLength = _tokenArray.length;

      _imagePicker = ImagePicker();

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
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]);

      setState(() {
        smilestartCountdown = true;
      });
    }catch(e){
      //
    }
  }

  //

  @override
  void dispose() {
    _stopLiveFeed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/home');
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
        // actions: [
        //   if (_allowPicker)
        //     Padding(
        //       padding: EdgeInsets.only(right: 20.0),
        //       child: GestureDetector(
        //         onTap: _switchScreenMode,
        //         child: Icon(
        //           _mode == ScreenMode.liveFeed
        //               ? Icons.photo_library_outlined
        //               : (Platform.isIOS
        //               ? Icons.camera_alt_outlined
        //               : Icons.camera),
        //         ),
        //       ),
        //     ),
        // ],
      ),
      body: _body(),
      // floatingActionButton: _floatingActionButton(), // I removed the floating button
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // I removed the floating Button
    );
  }

  Widget? _floatingActionButton() {
    if (_mode == ScreenMode.gallery) return null;
    if (cameras.length == 1) return null;
    return SizedBox(
        height: 70.0,
        width: 70.0,
        child: FloatingActionButton(
          child: Icon(
            Platform.isIOS
                ? Icons.flip_camera_ios_outlined
                : Icons.flip_camera_android_outlined,
            size: 40,
          ),
          onPressed: _switchLiveCamera,
        ));
  }

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

    Widget body;
    if (_mode == ScreenMode.liveFeed) {
      body = _liveFeedBody();
    } else {
      body = _galleryBody();
    }

    return StoreConnector<MyAppState, SGMessage>(
      converter: (store) => store.state.sg_message,
      builder: (context, SGMessage currentMessagestate) =>
          SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ((){
              print("******************** Conditions 1 ***************");
              print("Read Msg Flag ${widget.readmessage}");
              print("Countdown Flag $smilestartCountdown");
              if(widget.readmessage && smilestartCountdown == false){
                if(currentMessagestate.iscompleted){
                 // _createAlertDialog(context);
                  showDialog(
                    context: context,
                    barrierDismissible: true, // set to false if you want to force a rating
                   // builder: (context) => _dialog,
                    builder: (context) => showRatingAlert(context),
                  );
                }
                return SizedBox(height: 5,);
               // return AnimatedSwitcher(
               //    duration: const Duration(milliseconds: 500),
               //    transitionBuilder: (Widget child, Animation<double> animation) {
               //      return ScaleTransition(scale: animation, child: child);
               //    },
               //    child: Text(
               //      currentMessagestate.content,
               //      key: ValueKey<int>(_count),
               //      style: Theme.of(context).textTheme.headline4,
               //    ),
               //  );
              }else{
                return SizedBox(height: 5,);
              }
            }()),
            ((){
              print("******************** Conditions 2 ***************");
              print("Msg Complete Flag ${currentMessagestate.iscompleted}");
              if(currentMessagestate.iscompleted){
                _stopLiveFeed();
                if(highestpoint > currentMessagestate.tokenIndex){
                  return giftAlert(message: "you stopped smiling !",  amountWon: currentMessagestate.tokenIndex);
                }else{
                  return giftAlert(message: "Congratulations! highest score surpaased", amountWon: currentMessagestate.tokenIndex);
                }
              }else {
                int remaining = highestpoint - currentMessagestate.tokenIndex;
                 return _cameraDisplay(pointsleft: remaining);
              }
            }()),
           // _cameraDisplay(),
            SizedBox(
              height: 20,
            ),
            ((){
              print("******************** Conditions 3 ***************");
              print("Read Msg Flag ${widget.readmessage}");
              print("Countdown Flag $smilestartCountdown");
              if(!widget.readmessage && smilestartCountdown == false){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.secondary),
                      child: const Text('Refresh',),
                      onPressed: () {
                        refreshCamera(); // Refresh
                        SGMessage sgMSG = SGMessage(
                          content: "",
                          updated: true,
                          tokenIndex: 0,
                          iscompleted: false,
                          showStartCountDown: true,
                        );
                        StoreProvider.of<MyAppState>(context).dispatch(UpdateSGmessageAction(sgMSG));
                        _count += 1;
                      },
                    ),
                    SizedBox(width: 3,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.secondary),
                      child: const Text('Done',),
                      onPressed: () {
                       // _createAlertDialog(context);
                        showDialog(
                          context: context,
                          barrierDismissible: true, // set to false if you want to force a rating
                          //builder: (context) => _dialog,
                          builder: (context) => showRatingAlert(context),
                        );
                        _stopLiveFeed();
                      },
                    ),
                  ],
                );
              }else{
                return SizedBox(height: 5,);
              }
            }()),
          ],
        ),
      ),
    );
    return body;
  }

  Widget _liveFeedBody() {

    if(_controller != null){
      if(_controller?.value != null){
        if(_controller?.value.isInitialized == false){
          return Container();
        }
      }else{
        return Container();
      }
    }else{
      return Container();
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

  Widget _galleryBody() {
    return ListView(shrinkWrap: true, children: [
      _image != null
          ? SizedBox(
              height: 400,
              width: 400,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.file(_image!),
                  //TODO: COMMENTED OUT TODAY 20-09-2022
                  //if (widget.customPaint != null) widget.customPaint,
                ],
              ),
            )
          : Icon(
              Icons.image,
              size: 200,
            ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          child: Text('From Gallery'),
          onPressed: () => _getImage(ImageSource.gallery),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          child: Text('Take a picture'),
          onPressed: () => _getImage(ImageSource.camera),
        ),
      ),
      if (_image != null)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              '${_path == null ? '' : 'Image path: $_path'}\n\n${widget.text ?? ''}'),
        ),
    ]);
  }

  Future _getImage(ImageSource source) async {
    setState(() {
      _image = null;
      _path = null;
    });
    final pickedFile = await _imagePicker?.pickImage(source: source);
    if (pickedFile != null) {
      _processPickedFile(pickedFile);
    }
    setState(() {});
  }

  void _switchScreenMode() {
    _image = null;
    if (_mode == ScreenMode.liveFeed) {
      _mode = ScreenMode.gallery;
      _stopLiveFeed();
    } else {
      _mode = ScreenMode.liveFeed;
      _startLiveFeed();
    }
    if (widget.onScreenModeChanged != null) {
      widget.onScreenModeChanged!(_mode);
    }
    setState(() {});
  }

  Future _startLiveFeed() async {
    final camera = cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
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
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  Future _switchLiveCamera() async {
    setState(() => _changingCameraLens = true);
    _cameraIndex = (_cameraIndex + 1) % cameras.length;

    await _stopLiveFeed();
    await _startLiveFeed();
    setState(() => _changingCameraLens = false);
  }

  Future _processPickedFile(XFile pickedFile) async {
    final path = pickedFile?.path;
    if (path == null) {
      return;
    }
    setState(() {
      _image = File(path);
    });
    _path = path;
    final inputImage = InputImage.fromFilePath(path);
    widget.onImage(inputImage);
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

    final inputImage = InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    widget.onImage(inputImage);
  }

  // MY CODE
  Widget _cameraDisplay({required int pointsleft,}) {
    print("******************** Conditions 2A ***************");
    print("Controller Available ? ${_controller != null}");
    print("Smile Countdown Activated? $smilestartCountdown");
    if(_controller != null){
      if(_controller?.value != null){
        if(_controller?.value.isInitialized == false){
          // return Container();
          return SizedBox(height: MediaQuery.of(context).size.height * 0.6,);
        }
      }else{
       // return Container();
        return SizedBox(height: MediaQuery.of(context).size.height * 0.6,);
      }
    }else{
     // return Container();
      return SizedBox(height: MediaQuery.of(context).size.height * 0.6,);
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
      //color: Theme.of(context).colorScheme.secondary,
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          (_controller != null)? Transform.scale(
            scale: 1,
            child: Center(
              child: _changingCameraLens
                  ? Center(
                child: const Text('Changing camera lens'),
              )
                  : CameraPreview(_controller!),
            ),
          ) : SizedBox(height: MediaQuery.of(context).size.height * 0.6),
          // Transform.scale(
          //   scale: 1,
          //   child: Center(
          //     child: _changingCameraLens
          //         ? Center(
          //             child: const Text('Changing camera lens'),
          //           )
          //         : CameraPreview(_controller!),
          //   ),
          // ),
          Center(
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ScaleAnimatedText(
                    (pointsleft < 0) ? 'Congratulations ! \n New smile champion' : '',
                    scalingFactor: 0.2,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 16
                    )),
              ],
            ),
          ),
          //Center(child: _countdownTimer()), // THIS IS THE COUNTDOWN Original implementation
          ((){
            if(smilestartCountdown == true){
              return Center(child: _countdownTimer());
            }else{
              return SizedBox(height: 3.0,);
            }
          }()),
          ((){
            if(smilestartCountdown == false && !widget.readmessage ){
              return glassmorphicSmileGram();
            }else{
              return SizedBox(height: 3.0,);
            }
          }()),
          ((){
            if(smilestartCountdown == false && widget.readmessage){
              return glassmorphicReadMessage();
            }else{
              return SizedBox(height: 3.0,);
            }
          }()),
         // LuckPot(),
         // _giftMatrix()
        ],
      ),
    );
  }

  ScaleAnimatedText scaleValue({required String val}){
    return ScaleAnimatedText('$val',
        scalingFactor: 0.2,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontSize: 35.0,
        ));
  }

  Widget giftAlert({required String message, required int amountWon}){

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image:DecorationImage(
              image:AssetImage('images/custom/giftopen.png'),
              fit: BoxFit.cover,)),
        child: Stack(
          children: <Widget>[
            Center(
              //  child: Text(' Congratulations! your won $_value points', style: TextStyle(color: Theme.of(context).colorScheme.secondary ),),
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'SF',
                    color: Colors.red
                ),
                child: Center(
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      ScaleAnimatedText('$amountWon points won!',scalingFactor: 0.2, textAlign: TextAlign.center),
                      ScaleAnimatedText('$message !',scalingFactor: 0.2, textAlign: TextAlign.center),
                      ScaleAnimatedText('$amountWon points won!',scalingFactor: 0.2, textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }

  // void _randomize(){
  //   int _start = timerTastoPremuto.inMilliseconds;
  //   Random random = new Random();
  //   const oneDecimal = const Duration(seconds: 1);
  //   Timer _timer = new Timer.periodic(
  //       oneDecimal,
  //           (Timer timer) =>
  //           setState(() {
  //             _value = random.nextInt(23);
  //             print('Timer is : $_start  Index Value is $_value');
  //             if (_start < 1000) {
  //               _activated = true;
  //               _activation_index = _value;
  //               timer.cancel();
  //             } else {
  //               _start = _start - 1000;
  //               progressBarvalue = progressBarvalue - 1;
  //             }
  //           }));
  // }

  Widget _countdownTimer(){
    return Visibility(
      visible: smilestartCountdown,
      child: CircularCountDownTimer(
        duration: 10,
        initialDuration: 0,
        controller: CountDownController(),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        ringColor: Colors.grey[300]!,
        ringGradient: null,
       // fillColor: Colors.purpleAccent[100]!,
        fillColor: Colors.green[300]!,
        fillGradient: null,
       // backgroundColor: Colors.purple[500],
        backgroundColor: Colors.green[700],
        backgroundGradient: null,
        strokeWidth: 20.0,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(
            fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
        textFormat: CountdownTextFormat.S,
        isReverse: false,
        isReverseAnimation: false,
        isTimerTextShown: true,
       // autoStart: true,
        autoStart: smilestartCountdown,
        onStart: () {
          debugPrint('Countdown Started');
        },
        onComplete: () {
          debugPrint('Countdown Ended');
          setState(() {
            smilestartCountdown = false;
          });
        },
        onChange: (String timeStamp) {
          debugPrint('Countdown Changed $timeStamp');
        },
      ),
    );
  }


  // GLASSMORPHIC UI
Widget glassmorphicSmileGram(){
    return  StoreConnector<MyAppState, SGMessage>(
        converter: (store) => store.state.sg_message,
        builder: (context, SGMessage currentMessagestate) => Center(
          child: GlassmorphicContainer(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            borderRadius: 20,
            blur: 20,
            alignment: Alignment.bottomCenter,
            border: 2,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.1),
                  Color(0xFFFFFFFF).withOpacity(0.05),
                ],
                stops: [
                  0.1,
                  1,
                ]),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFffffff).withOpacity(0.5),
                Color((0xFFFFFFFF)).withOpacity(0.5),
              ],
            ),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:<Widget> [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 3,),
                            Text(
                              'Smile rating is : ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                              ),
                            ),
                             SizedBox(width: 3,),
                            Text(
                              (currentMessagestate.smileProbability == 0) ? 'Not started' : '${currentMessagestate.smileProbability}%',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              ScaleAnimatedText('110',
                                scalingFactor: 0.2,
                                textStyle: TextStyle(
                                    fontSize: 33.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    weatherMap(),
                  ],

                )
                //child: _smilegramDetector()
            ),
          ),
    ));
}

Widget glassmorphicReadMessage(){
    return  SingleChildScrollView(
      child: StoreConnector<MyAppState, SGMessage>(
          converter: (store) => store.state.sg_message,
          builder: (context, SGMessage currentMessagestate) => Center(
            child: GlassmorphicContainer(
              width: MediaQuery.of(context).size.width * 0.93,
              height: MediaQuery.of(context).size.height,
              borderRadius: 20,
              blur: 20,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.5),
                  Color((0xFFFFFFFF)).withOpacity(0.5),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Center(
                    child:  AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: Text(
                        currentMessagestate.content,
                        key: ValueKey<int>(_count),
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                ),
              ),
            ),
          )),
    );
  }

Widget weatherMap(){
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


  RatingDialog showRatingAlert(BuildContext context){
  return RatingDialog(
    showCloseButton: false,
    initialRating: 0.0,
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
      'How happy do you feel now?',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    ),
    // your app's logo?
    //image: const FlutterLogo(size: 100),
    image: Image.asset("assets/logo1.jpeg",width: 100, height: 100,),
    submitButtonText: 'Submit',
    commentHint: 'Set your custom comment hint',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      Navigator.of(context).popAndPushNamed('/home',);
      print('rating: ${response.rating}, comment: ${response.comment}');
    },
    submitButtonTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: Colors.green
    ),
  );
}

}

class Model {
  const Model(this.state, this.storage);

  final String state;
  final String storage;
}

