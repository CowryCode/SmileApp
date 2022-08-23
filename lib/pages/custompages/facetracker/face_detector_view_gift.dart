import 'dart:math';

import 'package:SmileApp/pages/custompages/facetracker/camera_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:SmileApp/pages/custompages/facetracker/camera_view_gift.dart';
import 'package:SmileApp/pages/custompages/facetracker/face_detector_painter.dart';
import 'package:SmileApp/pages/custompages/statemanagement/actions.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/pages/custompages/statemanagement/my_app_state.dart';

class FaceDetectorGiftView extends StatefulWidget {

 // final String msg;
 // final bool readmessage;
  final List<Object> data;

  FaceDetectorGiftView({Key key, this.data});

  @override
  _FaceDetectorGiftViewState createState() => _FaceDetectorGiftViewState();
}

class _FaceDetectorGiftViewState extends State<FaceDetectorGiftView> {

  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      //enableContours: true, // Original code
      enableContours: true,
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
  // String _fulltext = "I am a living testimony testimony that God is good"; // My Code
  // int _tokenIndex = 0; // My Code
  //var _tokenArray ;
  List<String> _tokenArray ;
  int _tokenArrayLength;

  bool readmessage = false;

  @override
  void initState() {
    super.initState();
    String _fulltext = widget.data[0];
    readmessage =  widget.data[1];
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
      title: readmessage? 'Smile and Hold' : 'Smile for Gift',
      customPaint: _customPaint,
      text: _text,
      onImage: (inputImage) {
        processImage(inputImage);
      },
      initialDirection: CameraLensDirection.front,
      readmessage: readmessage,
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
        SGMessage sgMessage = StoreProvider
            .of<MyAppState>(context)
            .state
            .sg_message;
        double prob = face.smilingProbability;
        if(sgMessage.showStartCountDown == false){
        if (readmessage) {
          if (sgMessage.tokenIndex < _tokenArrayLength && prob > 0.5) {
            _msg = sgMessage.content + " " + _tokenArray[sgMessage.tokenIndex];
            int updatedTokenIndex = sgMessage.tokenIndex + 1;
            SGMessage sgMSG = SGMessage(
                content: _msg, updated: true, tokenIndex: updatedTokenIndex, showStartCountDown: false);
            StoreProvider.of<MyAppState>(context).dispatch(
                UpdateSGmessageAction(sgMSG)
            );
            _count += 1;
          }
        } else {
          double roundedProb = changeDecimalplaces(value: prob, decimalplaces: 2);
          if (prob > 0.5) {
            int updatedTokenIndex = sgMessage.tokenIndex + 1;
            SGMessage sgMSG = SGMessage(
                content: _msg,
                updated: true,
                tokenIndex: updatedTokenIndex,
                iscompleted: false,
              showStartCountDown: false,
              smileProbability: roundedProb * 100, // converting 0.9 to 90
            );
            StoreProvider.of<MyAppState>(context).dispatch(
                UpdateSGmessageAction(sgMSG));
          } else {
            SGMessage sgMSG = SGMessage(
                content: _msg,
                updated: true,
                tokenIndex: sgMessage.tokenIndex,
                iscompleted: true,
              smileProbability: roundedProb * 100,
            );
            StoreProvider.of<MyAppState>(context).dispatch(
                UpdateSGmessageAction(sgMSG));
          }
        }

        // End State Update
      }
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

  double changeDecimalplaces({@required double value, @required int decimalplaces}){
    double newNum = double.parse((value).toStringAsFixed(decimalplaces));
    return newNum;
  }
}