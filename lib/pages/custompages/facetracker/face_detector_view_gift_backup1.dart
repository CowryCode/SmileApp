import 'dart:math';

import 'package:SmileApp/apis/models/countrymodel.dart';
import 'package:SmileApp/apis/models/globemodel.dart';
import 'package:SmileApp/models/mymodels/smilemodels/giftvariableobject.dart';
import 'package:SmileApp/pages/custompages/facetracker/camera_view_gift_backup1.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:SmileApp/pages/custompages/statemanagement/actions.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/pages/custompages/statemanagement/my_app_state.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class FaceDetectorGiftView extends StatefulWidget {


  //final List<Object>? data;
  final GiftVariableObject giftVariableObject;

  FaceDetectorGiftView({Key? key,  required this.giftVariableObject});

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
  // CustomPaint _customPaint;
  // String _text;
  //TODO: COMMENTED OUT TODAY 20-09-2022
  //CustomPaint customPaint;
  String _text = " i AM TESTING";

  // Start
  //int _count = 0; // My Code
  String _msg = ""; // My Code
  // List<String> _tokenArray ;
  // int _tokenArrayLength;
  List<String>? _tokenArray ;
  int? _tokenArrayLength;

  bool readmessage_ = false;
  String? _fulltext;
  @override
  void initState() {
    super.initState();
    // String _fulltext = widget.data[0]!;
    // readmessage =  widget.data![1];
    // _tokenArray = _fulltext.split(" ");
    // _tokenArrayLength = _tokenArray.length;
    _fulltext = widget.giftVariableObject.fulltext;
    // readmessage =  widget.giftVariableObject.readmessage!;
    _tokenArray = _fulltext!.split(" ");
    _tokenArrayLength = _tokenArray!.length;
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
      title: widget.giftVariableObject.readmessage!? 'Smile and Hold' : 'Smile for Gift',
     // customPaint: customPaint,
     // text: _text!,
      onImage: (inputImage) {
        processImage(inputImage);
      },
      initialDirection: CameraLensDirection.front,
      readmessage: widget.giftVariableObject.readmessage!,
     // readmessage: readmessage,
    );

  }

  Future<void> processImage(InputImage inputImage) async {

    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    // setState(() {
    //   _text = '';
    // });
    final faces = await _faceDetector.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      //TODO: COMMENTED OUT TODAY 20-09-2022
      // final painter = FaceDetectorPainter(
      //     faces,
      //     inputImage.inputImageData!.size,
      //     inputImage.inputImageData!.imageRotation);
      //customPaint = CustomPaint(painter: painter);
      // MY CODE
      for (final face in faces) {
        print(" SMILE Probability is :  ${face.smilingProbability}");
         // State Update
        SGMessage sgMessage = StoreProvider
            .of<MyAppState>(context)
            .state
            .sg_message;
        double? prob = face.smilingProbability;
        if(sgMessage.showStartCountDown == false){
        if (widget.giftVariableObject.readmessage!) {
          if(sgMessage.tokenIndex < _tokenArrayLength! ){
            if (prob! > 0.5) {
              _msg = sgMessage.content + " " + _tokenArray![sgMessage.tokenIndex];
              int updatedTokenIndex = sgMessage.tokenIndex + 1;
              SGMessage sgMSG = SGMessage(
                  content: _msg, updated: true, tokenIndex: updatedTokenIndex, showStartCountDown: false);
              StoreProvider.of<MyAppState>(context).dispatch(
                  UpdateSGmessageAction(sgMSG)
              );
              //_count += 1;
            }
          }else{
            _msg = sgMessage.content;
            int updatedTokenIndex = sgMessage.tokenIndex + 1;
            SGMessage sgMSG = SGMessage(
                content: _msg,
                updated: true,
                tokenIndex: updatedTokenIndex,
                showStartCountDown: false,
              iscompleted: true
            );
            StoreProvider.of<MyAppState>(context).dispatch(
                UpdateSGmessageAction(sgMSG)
            );
            //_count += 1;
          }
        } else {
          double roundedProb = changeDecimalplaces(value: prob!, decimalplaces: 2);
          if (prob > 0.5) {
            int updatedTokenIndex = sgMessage.tokenIndex + 1;
            if(updatedTokenIndex >= 12){
              String countryIDstring = sgMessage.userCountriesIndexString?? "0";
              List<int>? indicesCount = GlobeModel().splitString(countriesIndexString: countryIDstring);
              if((indicesCount!.length) < GlobeModel().modelsDictionary().length){
                List<Model>? data = GlobeModel().getProcessedcountries(userCountriesIndexString: countryIDstring);
                String updatedIDs =  countryIDstring + ",${data!.length}";
                MapShapeSource sublayerDataSource = MapShapeSource.asset(
                  "assets/world_map.json",
                  shapeDataField: "admin",
                  dataCount: data!.length,
                  primaryValueMapper: (int index) {
                    return data![index].state;
                  },
                  shapeColorValueMapper: (int index) {
                    return data![index].storage;
                  },
                  shapeColorMappers: [
                    MapColorMapper(value: "Low", color: Colors.red),
                    MapColorMapper(value: "High", color: Colors.green)
                  ],
                );

                updatedTokenIndex = 0;
                SGMessage sgMSG = SGMessage(content: _msg, updated: true, tokenIndex: updatedTokenIndex,
                  iscompleted: false, showStartCountDown: false, smileProbability: roundedProb * 100, // converting 0.9 to 90
                );
                sgMSG.setCountriesID(countriesID: updatedIDs);
                sgMSG.setSubLayerDataSource(subelayerdata: sublayerDataSource);
                sgMSG.setTokenindex(indexcount: updatedTokenIndex);
                StoreProvider.of<MyAppState>(context).dispatch(
                    UpdateSGmessageAction(sgMSG));
              }else{
                // Reinitialize Map
                updatedTokenIndex = 0;
                List<Model>? data = GlobeModel().getProcessedcountries(userCountriesIndexString: "0");
                MapShapeSource sublayerDataSource = MapShapeSource.asset(
                  "assets/world_map.json", shapeDataField: "admin", dataCount: data!.length,
                  primaryValueMapper: (int index) {
                    return data![index].state;
                  },
                  shapeColorValueMapper: (int index) {
                    return data![index].storage;
                  },
                  shapeColorMappers: [
                    MapColorMapper(value: "Low", color: Colors.red),
                    MapColorMapper(value: "High", color: Colors.green)
                  ],
                );
                SGMessage sgMSG = SGMessage(content: _msg, updated: true, tokenIndex: updatedTokenIndex,
                  iscompleted: true, showStartCountDown: false, smileProbability: roundedProb * 100, // converting 0.9 to 90
                );
                sgMSG.setCountriesID(countriesID: "0");
                sgMSG.setSubLayerDataSource(subelayerdata: sublayerDataSource);
                sgMSG.setTokenindex(indexcount: updatedTokenIndex);
                StoreProvider.of<MyAppState>(context).dispatch(
                    UpdateSGmessageAction(sgMSG));
              }
            }
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
      //TODO: COMMENTED OUT TODAY 20-09-2022
     // customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
     // setState(() {});
    }
  }

  double changeDecimalplaces({required double value, required int decimalplaces}){
    double newNum = double.parse((value).toStringAsFixed(decimalplaces));
    return newNum;
  }
}