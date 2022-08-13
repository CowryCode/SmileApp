import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:SmileApp/pages/custompages/facetracker/camera_view_gift.dart';
import 'package:SmileApp/pages/custompages/facetracker/face_detector_painter.dart';
import 'package:SmileApp/pages/custompages/statemanagement/actions.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/timerdatamodel.dart';
import 'package:SmileApp/pages/custompages/statemanagement/my_app_state.dart';

import 'camera_view.dart';

class FaceDetectorGiftView extends StatefulWidget {
  @override
  _FaceDetectorGiftViewState createState() => _FaceDetectorGiftViewState();
}

class _FaceDetectorGiftViewState extends State<FaceDetectorGiftView> {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      //enableContours: true, // Original code
      enableContours: false,
      enableClassification: true,
    ),
  );
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint _customPaint;
  String _text;

  // Start
  int _count = 0; // My Code
  String _msg = ""; // My Code
  String _fulltext = "I am a living testimony testimony that God is good"; // My Code
  // int _tokenIndex = 0; // My Code
  //var _tokenArray ;
  List<String> _tokenArray ;
  int _tokenArrayLength;

  @override
  void initState() {
    super.initState();
    _tokenArray = _fulltext.split(" ");
    _tokenArrayLength = _tokenArray.length;
  }
  //  End

  @override
  void dispose() {
    _canProcess = false;
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraViewGift(
      title: 'Smile for Gift',
      customPaint: _customPaint,
      text: _text,
      onImage: (inputImage) {
        processImage(inputImage);
      },
      initialDirection: CameraLensDirection.front,
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final faces = await _faceDetector.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = FaceDetectorPainter(
          faces,
          inputImage.inputImageData.size,
          inputImage.inputImageData.imageRotation);
      _customPaint = CustomPaint(painter: painter);
      // MY CODE
      for (final face in faces) {
        print(" SMILE Probability is :  ${face.smilingProbability}");
        // State Update
        SGMessage sgMessage = StoreProvider.of<MyAppState>(context).state.sg_message;
        double prob = face.smilingProbability;
      //  if(_tokenIndex < _tokenArrayLength && prob > 0.7){
        if(sgMessage.tokenIndex < _tokenArrayLength && prob > 0.7){
          _msg = sgMessage.content + " " + _tokenArray[sgMessage.tokenIndex];
          int updatedTokenIndex = sgMessage.tokenIndex + 1;
          SGMessage sgMSG = SGMessage(content: _msg, updated: true, tokenIndex: updatedTokenIndex);

          bool smiling = StoreProvider.of<MyAppState>(context).state.luckPotTimerstatemodel.activate;
          StoreProvider.of<MyAppState>(context).dispatch(
              LuckPotTimerAction(LuckPotTimerstatemodel(activate: !smiling))
          );
          // StoreProvider.of<MyAppState>(context).dispatch(
          //     UpdateSGmessageAction(sgMSG)
          // );
          _count += 1;
        }
        // End State Update
      }
      // MY CODE
    } else {
      String text = 'Faces found: ${faces.length}\n\n';
      for (final face in faces) {
        text += 'face: ${face.boundingBox}\n\n';
      }
      _text = text;
      // TODO: set _customPaint to draw boundingRect on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}