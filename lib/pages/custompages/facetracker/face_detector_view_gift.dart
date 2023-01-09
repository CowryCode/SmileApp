
import 'package:SmileApp/TextToSpeech/smileappvoice.dart';
import 'package:SmileApp/apis/network.dart';
import 'package:SmileApp/models/countrymodel.dart';
import 'package:SmileApp/apis/networkUtilities.dart';
import 'package:SmileApp/models/mymodels/giftvariableobject.dart';
import 'package:SmileApp/pages/custompages/facetracker/camera_view_gift.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';


class FaceDetectorGiftView extends StatefulWidget {


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

  String _msg = ""; // My Code

  List<String>? _tokenArray ;
  int? _tokenArrayLength;

  bool readmessage_ = false;
  String? _fulltext;

  SmileAppVoice? talker;



  @override
  void initState() {
    super.initState();
   // _fulltext = widget.giftVariableObject.fulltext;
    if(widget.giftVariableObject.readmessage == true){
      //_fulltext = widget.giftVariableObject.messageModel!.content;
      _fulltext = widget.giftVariableObject.msg!;
      _tokenArray = _fulltext!.split(" ");
      _tokenArrayLength = _tokenArray!.length;
    }
    talker = SmileAppVoice();
  }

  @override
  void dispose() {
    _canProcess = false;
    _faceDetector.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CameraViewGift(
      title: widget.giftVariableObject.readmessage!? 'Smile and Hold' : 'SmileGram',
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
    final faces = await _faceDetector.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {

      for (final face in faces) {
        print(" SMILE Probability is :  ${face.smilingProbability}");
        bool soundAllowed = smileAppValueNotifier.value.deactivetSound.value;
        bool activateSpeech = smileAppValueNotifier.value.activatespeech.value;
        double? prob = face.smilingProbability;
        if(smileAppValueNotifier.value.showCountDown.value == false){
          if (widget.giftVariableObject.readmessage!) {
            //if(sgMessage.tokenIndex < _tokenArrayLength! ){
            if(messageNotifier.value.index < _tokenArrayLength! ){
              if (prob! > 0.5) {
                smileGameNofitier.moveObject(smilesize: prob, isSmileGram: false);
                // This condition is to make the image drop gradually
                if(smileGameNofitier.getSmileDurationCounter() % 3 == 0 ){
                  _msg = messageNotifier.value.msg + " " + _tokenArray![messageNotifier.value.index];
                  (messageNotifier.value.index) == (_tokenArrayLength! - 1) ? _msg = _msg + " *** End" : _msg = _msg;
                  (messageNotifier.value.index) == (_tokenArrayLength! - 1) ? ApiAccess().readTribeMessage(messageID: widget.giftVariableObject.id!):"";
                  int updatedTokenIndex = messageNotifier.value.index + 1;
                  messageNotifier.update(message: _msg, index: updatedTokenIndex);
                }
              }else{
                if(!soundAllowed){
                  if(activateSpeech){
                    talker!.speak(text: "Keep Smiling");
                    smileAppValueNotifier.speechActivationCountInitialized();
                  }
                  smileAppValueNotifier.updateSpeechActivationCount();
                }
              }
            }else{
              smileAppValueNotifier.updateShowMoodRating(showMoodrate: true);
              return ;
            }
          } else {
           // if (prob! > 0.5 && smileGameNofitier.value.targetCaught == false) {
            if (prob! > 0.5 ) {
              smileGameNofitier.moveObject(smilesize: prob, isSmileGram: true);
              int updatedTokenIndex = smileAppValueNotifier.value.smileDurationCount.value;
              // This reduces the count down on the smile screan
              smileAppValueNotifier.updateSmileDurationCount();

              if(smileGameNofitier.value.targetCaught == true){
                talker!.speak(text: "Great!");
                String countryIDstring = smileAppValueNotifier.value.countriesIndexString.value;
                List<int>? indicesCount = worldmapModel.splitString(countriesIndexString: countryIDstring);
                if((indicesCount!.length) < worldmapModel.modelsDictionary().length){
                  String updatedIDs =  countryIDstring + ",${indicesCount.length}";
                  int nextCountryID = indicesCount.length + 1;
                  smileAppValueNotifier.updateCountriesIndexString(countriesIndex: updatedIDs, nextID: nextCountryID);
                }else{
                  smileAppValueNotifier.updateCountriesIndexString(countriesIndex: "0", nextID: 0);
                }
                smileGameNofitier.updateTargetCaught(holdTarget: false);
              }

              if(updatedTokenIndex <= 0 ){
                smileGameNofitier.changeTargetObjectPosition();
                smileAppValueNotifier.refreshSmileDurationCount();
               // if(updatedTokenIndex <= 0 || smileGameNofitier.value.targetCaught == true){
                // talker!.speak(text: "Great!");
                // smileGameNofitier.changeTargetObjectPosition();
                // String countryIDstring = smileAppValueNotifier.value.countriesIndexString.value;
                // List<int>? indicesCount = worldmapModel.splitString(countriesIndexString: countryIDstring);
                // if((indicesCount!.length) < worldmapModel.modelsDictionary().length){
                //   String updatedIDs =  countryIDstring + ",${indicesCount.length}";
                //   int nextCountryID = indicesCount.length + 1;
                //   smileAppValueNotifier.updateCountriesIndexString(countriesIndex: updatedIDs, nextID: nextCountryID);
                // }else{
                //   smileAppValueNotifier.updateCountriesIndexString(countriesIndex: "0", nextID: 0);
                // }
                // smileAppValueNotifier.refreshSmileDurationCount();
              }else{
              }
            }else{
              if(!soundAllowed){
                if(activateSpeech && smileGameNofitier.value.targetCaught == false){
                  talker!.speak(text: "Keep Smiling");
                  smileAppValueNotifier.speechActivationCountInitialized();
                }
                smileAppValueNotifier.updateSpeechActivationCount();
              }
            }
          }
        }
      }
    } else {
      String text = 'Faces found: ${faces.length}\n\n';
      for (final face in faces) {
        text += 'face: ${face.boundingBox}\n\n';
      }
      // _text = text;
      // TODO: set _customPaint to draw boundingRect on top of image
      //TODO: COMMENTED OUT TODAY 20-09-2022
      // customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      // setState(() {});
    }
  }

  // Future<void> processImage(InputImage inputImage) async {
  //
  //   if (!_canProcess) return;
  //   if (_isBusy) return;
  //   _isBusy = true;
  //   final faces = await _faceDetector.processImage(inputImage);
  //   if (inputImage.inputImageData?.size != null &&
  //       inputImage.inputImageData?.imageRotation != null) {
  //
  //     for (final face in faces) {
  //       print(" SMILE Probability is :  ${face.smilingProbability}");
  //       SGMessage sgMessage = StoreProvider.of<MyAppState>(context).state.sg_message;
  //       double? prob = face.smilingProbability;
  //       if(sgMessage.showStartCountDown == false){
  //       if (widget.giftVariableObject.readmessage!) {
  //         if(sgMessage.tokenIndex < _tokenArrayLength! ){
  //           if (prob! > 0.5) {
  //             _msg = sgMessage.content + " " + _tokenArray![sgMessage.tokenIndex];
  //             int updatedTokenIndex = sgMessage.tokenIndex + 1;
  //             SGMessage sgMSG = SGMessage(
  //                 content: _msg, updated: true, tokenIndex: updatedTokenIndex, showStartCountDown: false);
  //             StoreProvider.of<MyAppState>(context).dispatch(
  //                 UpdateSGmessageAction(sgMSG)
  //             );
  //           }
  //         }else{
  //           _msg = sgMessage.content;
  //           int updatedTokenIndex = sgMessage.tokenIndex + 1;
  //           SGMessage sgMSG = SGMessage(
  //               content: _msg,
  //               updated: true,
  //               tokenIndex: updatedTokenIndex,
  //               showStartCountDown: false,
  //             iscompleted: true
  //           );
  //           StoreProvider.of<MyAppState>(context).dispatch(
  //               UpdateSGmessageAction(sgMSG)
  //           );
  //         }
  //       } else {
  //         double roundedProb = changeDecimalplaces(value: prob!, decimalplaces: 2);
  //         if (prob > 0.5) {
  //           int updatedTokenIndex = sgMessage.tokenIndex + 1;
  //           print("INDEX : ${updatedTokenIndex}");
  //           print("INDEX STRING : ${sgMessage.userCountriesIndexString}");
  //           if(updatedTokenIndex >= 5){
  //             String countryIDstring = sgMessage.userCountriesIndexString?? "0";
  //             List<int>? indicesCount = GlobeModel().splitString(countriesIndexString: countryIDstring);
  //             if((indicesCount!.length) < GlobeModel().modelsDictionary().length){
  //               List<Model>? data = GlobeModel().getProcessedcountries(userCountriesIndexString: countryIDstring);
  //               String updatedIDs =  countryIDstring + ",${data!.length}";
  //               MapShapeSource sublayerDataSource = MapShapeSource.asset(
  //                 "assets/world_map.json",
  //                 shapeDataField: "admin",
  //                 dataCount: data!.length,
  //                 primaryValueMapper: (int index) {
  //                   return data![index].state;
  //                 },
  //                 shapeColorValueMapper: (int index) {
  //                   return data![index].storage;
  //                 },
  //                 shapeColorMappers: [
  //                   MapColorMapper(value: "Low", color: Colors.red),
  //                   MapColorMapper(value: "High", color: Colors.green)
  //                 ],
  //               );
  //               updatedTokenIndex = 0;
  //               SGMessage sgMSG = SGMessage(content: _msg, updated: true, tokenIndex: updatedTokenIndex,
  //                 iscompleted: false, showStartCountDown: false, smileProbability: roundedProb * 100, // converting 0.9 to 90
  //               );
  //               sgMSG.setCountriesID(countriesID: updatedIDs);
  //               sgMSG.setTokenindex(indexcount: updatedTokenIndex);
  //              sgMSG.setSubLayerDataSource(subelayerdata: sublayerDataSource);
  //              StoreProvider.of<MyAppState>(context).dispatch(UpdateSGmessageAction(sgMSG));
  //             }else{
  //               updatedTokenIndex = 0;
  //               List<Model>? data = GlobeModel().getProcessedcountries(userCountriesIndexString: "0");
  //               MapShapeSource sublayerDataSource = MapShapeSource.asset(
  //                 "assets/world_map.json", shapeDataField: "admin", dataCount: data!.length,
  //                 primaryValueMapper: (int index) {
  //                   return data![index].state;
  //                 },
  //                 shapeColorValueMapper: (int index) {
  //                   return data![index].storage;
  //                 },
  //                 shapeColorMappers: [
  //                   MapColorMapper(value: "Low", color: Colors.red),
  //                   MapColorMapper(value: "High", color: Colors.green)
  //                 ],
  //               );
  //               SGMessage sgMSG = SGMessage(content: _msg, updated: true, tokenIndex: updatedTokenIndex,
  //                 iscompleted: true, showStartCountDown: false, smileProbability: roundedProb * 100, // converting 0.9 to 90
  //               );
  //               sgMSG.setCountriesID(countriesID: "0");
  //               sgMSG.setTokenindex(indexcount: updatedTokenIndex);
  //               sgMSG.setSubLayerDataSource(subelayerdata: sublayerDataSource);
  //               StoreProvider.of<MyAppState>(context).dispatch(UpdateSGmessageAction(sgMSG));
  //             }
  //           }else{
  //             sgMessage.setTokenindex(indexcount: updatedTokenIndex);
  //             List<Model>? data = GlobeModel().getProcessedcountries(userCountriesIndexString: "${sgMessage.userCountriesIndexString}");
  //             MapShapeSource sublayerDataSource = MapShapeSource.asset(
  //               "assets/world_map.json", shapeDataField: "admin", dataCount: data!.length,
  //               primaryValueMapper: (int index) {
  //                 return data![index].state;
  //               },
  //               shapeColorValueMapper: (int index) {
  //                 return data![index].storage;
  //               },
  //               shapeColorMappers: [
  //                 MapColorMapper(value: "Low", color: Colors.red),
  //                 MapColorMapper(value: "High", color: Colors.green)
  //               ],
  //             );
  //             sgMessage.setSubLayerDataSource(subelayerdata: sublayerDataSource);
  //             StoreProvider.of<MyAppState>(context).dispatch(UpdateSGmessageAction(sgMessage));
  //           }
  //         }
  //       }
  //     }
  //     }
  //   } else {
  //     String text = 'Faces found: ${faces.length}\n\n';
  //     for (final face in faces) {
  //       text += 'face: ${face.boundingBox}\n\n';
  //     }
  //     _text = text;
  //     // TODO: set _customPaint to draw boundingRect on top of image
  //     //TODO: COMMENTED OUT TODAY 20-09-2022
  //    // customPaint = null;
  //   }
  //   _isBusy = false;
  //   if (mounted) {
  //    // setState(() {});
  //   }
  // }

  double changeDecimalplaces({required double value, required int decimalplaces}){
    return  double.parse((value).toStringAsFixed(decimalplaces));
  }
}