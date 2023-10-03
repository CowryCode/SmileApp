
import 'dart:math';

import 'package:SmileApp/apis/models/tribemessage.dart';
import 'package:SmileApp/models/mymodels/giftvariableobject.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/mymodels/user.dart';



class TribeMessageList extends StatefulWidget {
  final User currentUser_ = User.init().getCurrentUser();
  @override
  _TribeMessageListState createState() => _TribeMessageListState();
}

class _TribeMessageListState extends State<TribeMessageList> {

  Random? random;

  @override
  void initState() {
     random = new Random();
  }

  User currentUser_ = new User.init().getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16.0),bottomRight: Radius.circular(16.0)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color:Theme.of(context).primaryColor ),
          onPressed: (){
             Navigator.of(context).pushNamed('/home', arguments:["currentUser.name","currentUser.phoneNumber"]);
           // Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Opened Notes',
          style: TextStyle(
            fontSize:22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
             onPressed: () {
               Navigator.popAndPushNamed(context, '/emotions');
               // showDialog<String>(
               //   context: context,
               //   builder: (BuildContext context) => AlertDialog(
               //     title: const Text('My Tribe', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),),
               //     content: const Text('Get beautiful messages from other users. Will you want to continue ?', style: TextStyle(color: Colors.black),),
               //     actions: <Widget>[
               //       TextButton(
               //         onPressed: () => Navigator.pop(context, 'Cancel'),
               //         child: const Text('Cancel'),
               //       ),
               //       TextButton(
               //         onPressed: (){
               //           Navigator.popAndPushNamed(context, '/emotions');
               //         },
               //         child: const Text('Yes'),
               //       ),
               //     ],
               //   ),
               // );
             },
             backgroundColor: Theme.of(context).colorScheme.secondary,
             child: const Icon(FontAwesomeIcons.peopleGroup),
      ),
      body: Center(
        child:ValueListenableBuilder(
          valueListenable: readtribeMessageNotifier,
            builder: (context,  List<TribeMessage> messeges, child){
              if ((messeges.length < 1)) {
                return Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0,),
                child: Text('You have no opened messages. \n '
                    'Check on the Home Screen for "SmilePacks". \n \n'
                    'You can also click on the button below to get supportive messages',
                    textAlign: TextAlign.center),
              );
              }else{
                return Container(
                  child:CarouselSlider(
                    options: CarouselOptions(
                      // height: 100,
                      height: (MediaQuery.of(context).size.height) * 0.8 ,
                      aspectRatio: 16/9,
                      viewportFraction: 0.8, initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: messeges.map((e) => MessageCard(measageModel: e, colorID: randomColorSelector(),) ).toList(),
                  ),
                );
              }
            }
        ),
      ),
    );
  }

  int randomColorSelector(){
    try{
      return random!.nextInt(3) + 1;
    }catch(e){
      return 1;
    }

  }


}

class MessageCard extends StatelessWidget {
 // final TribeMessageModel measageModel;
  final TribeMessage measageModel;
  final int colorID;

  const MessageCard({Key? key, required this.measageModel, required this.colorID }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Card(
        elevation: 1,
        color: (colorID == 1) ? Colors.blueGrey : (colorID == 2) ? Colors.orange : Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                     "${measageModel.sourceCountry}",
                      style: TextStyle(
                        fontSize:12.0,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                      ),
                    ),
                  //  if(measageModel.read == true) IconButton(
                    if(measageModel.isread == true) IconButton(
                      icon: const Icon(FontAwesomeIcons.solidEnvelopeOpen),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        _showAlert(context: context, msgModel: measageModel);
                      },
                    ),
                  ],
                ),
               SizedBox(height:20 ),
                Center(
                  child: Text(
                   // (measageModel.read == true) ?  "${measageModel.content}" : " You received \n a note from ${measageModel.source}. \n Open the envelope below to read",
                    (measageModel.isread == true) ?  "${measageModel.content}" : " You received \n a note from ${measageModel.sourceCountry}. \n Open the envelope below to read",
                    style: TextStyle(
                        fontSize:16.0,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
               // if(measageModel.read == false) IconButton(
                if(measageModel.isread == false) IconButton(
                  icon: const Icon(FontAwesomeIcons.solidEnvelope),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    _showAlert(context: context, msgModel: measageModel);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _showAlert({required BuildContext context, required TribeMessageModel msgModel}){
  _showAlert({required BuildContext context, required TribeMessage msgModel}){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Smile Gram'),
        content: const Text('To read this you need to maintain a smile as the message unfolds',
          style: TextStyle(color: Colors.black45),
        ),
        actions: <Widget>[
          TextButton(
            //  onPressed: () => Navigator.pop(context, 'Cancel'),
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text('Cancel', ),
          ),
          TextButton(
            onPressed: (){
              messageNotifier.update(message: "", index: 0);
              GiftVariableObject giftobject = GiftVariableObject(id:msgModel.id,  msg: msgModel.content, readmessage: true);
              Navigator.of(context).popAndPushNamed('/smilegramgift', arguments: giftobject);
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}

class TribeMessageModel{
  int id;
  String source;
  String content;
  bool read;
  TribeMessageModel({required this.id,  required this.source ,required this.content, required this.read});
}
