
import 'dart:math';

import 'package:SmileApp/models/mymodels/smilemodels/giftvariableobject.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SmileApp/models/mymodels/user.dart';



class TribeMessageList extends StatefulWidget {
  final User currentUser=User.init().getCurrentUser();
  @override
  _TribeMessageListState createState() => _TribeMessageListState();
}

class _TribeMessageListState extends State<TribeMessageList> {

  Random? random;

  @override
  void initState() {
     random = new Random();
  }

  User currentUser = new User.init().getCurrentUser();
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
            // Navigator.of(context).pushNamed('/home', arguments:[currentUser.name,currentUser.phoneNumber]);
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Support Notes',
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
               showDialog<String>(
                 context: context,
                 builder: (BuildContext context) => AlertDialog(
                   title: const Text('My Tribe', style: TextStyle(color: Colors.black45),),
                   content: const Text('Get beautiful messages from across the world. Will you want to continue ?', style: TextStyle(color: Colors.black45),),
                   actions: <Widget>[
                     TextButton(
                       onPressed: () => Navigator.pop(context, 'Cancel'),
                       child: const Text('Cancel'),
                     ),
                     TextButton(
                       onPressed: (){
                         Navigator.popAndPushNamed(context, '/emotions');
                       },
                       child: const Text('Yes'),
                     ),
                   ],
                 ),
               );
             },
             backgroundColor: Theme.of(context).colorScheme.secondary,
             child: const Icon(FontAwesomeIcons.peopleGroup),
      ),
      body: Center(
        child:Container(
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
            items: getMessages(),
          ),
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

  List<Widget> getMessages(){
    List<TribeMessageModel> data = <TribeMessageModel>[
      TribeMessageModel(messageID: 1, source: "United Kindom", read: true,
    content: "This story leapt off the pages as I relived it with tears and joy. My friends Brad and Beth have done a superb job of retelling the story that changed so many of our lives. Truly, Mitchell Thorp’s story will change your life as well. "
    ),
      TribeMessageModel(messageID: 2, source: "South Africa", read: false,
        content: "This incredible true story is how God can take what was meant for evil and turn it into something beautiful for his glory. This story will touch the hearts of many who need to know how to hear the voice of God, and how God intervenes in our lives in many amazing ways."
      ),
      TribeMessageModel(messageID: 3, source: "Canada", read: true,
        content: "Few organizations see the “big picture” of charitable giving. But thanks to Brad and Beth Thorp, the Mitchell Thorp Foundation does. Through their own life tragedy in losing their son Mitchell in 2008, Brad and Beth Thorp have embraced their sorrow and have turned it into the most beautiful way of honoring his legacy, by helping those most vulnerable patients and their families."
      ),
    ];
   return data.map((e) => MessageCard(measageModel: e, colorID: randomColorSelector(),) ).toList();
  }

}

class MessageCard extends StatelessWidget {
  final TribeMessageModel measageModel;
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                     "${measageModel.source}",
                      style: TextStyle(
                        fontSize:12.0,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                      ),
                    ),
                    (measageModel.read == false) ? IconButton(
                      icon: const Icon(FontAwesomeIcons.solidFolderClosed),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        _showAlert(context: context, msgModel: measageModel);
                      },
                    ) : SizedBox(height: 2,)
                  ],
                ),
                SizedBox(height: (measageModel.read == true) ? 20 : 80),
                Center(
                  child: Text(
                    (measageModel.read == true) ?  "${measageModel.content}" : " Note from someone in Nigeria. \n Click on the box icon to read",
                    style: TextStyle(
                        fontSize:16.0,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showAlert({required BuildContext context, required TribeMessageModel msgModel}){
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
              debugPrint("PRESSED THE BUTTON ::::");
              GiftVariableObject giftobject = GiftVariableObject(messageModel: msgModel, readmessage: true);
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
  int messageID;
  String source;
  String content;
  bool read;
  TribeMessageModel({required this.messageID,  required this.source ,required this.content, required this.read});
}
