import 'package:SmileApp/pages/custompages/tribes/tribe_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:SmileApp/pages/acount.dart';
import 'package:SmileApp/pages/conversations.dart' as prefix0;
import 'package:SmileApp/pages/custompages/home.dart';
import 'package:SmileApp/pages/custompages/user_profile_widget.dart';

class NavigateTabsWidget extends StatefulWidget {

 // final String value;
  // const NavigateTabsWidget({Key key}) : super(key: key);
  final bool showEmotionalert;
  const NavigateTabsWidget({Key? key, required this.showEmotionalert}) : super(key: key);

  
  @override
  State<StatefulWidget> createState() {
    return _BubblesState();
  }
}

class _BubblesState extends State<NavigateTabsWidget> with SingleTickerProviderStateMixin {
  // AnimationController _controller;
  AnimationController? _controller;
  int _page = 4;
  String currentTitle = 'Home';
  Widget _currentPage (int page){
    switch (page){
      case 0 :
        currentTitle = 'Home';
       // return Home(value: "${widget.acountInfos[0]}");
        return Home(checkEmotion: false,);
      case 1 :
        currentTitle = 'chat';  
       // return prefix0.Conversation();
        return TribePage();
      case 2 :
        currentTitle = 'profile';
       // return AcountWidget(acountInfos: ["${widget.acountInfos[0]}","${widget.acountInfos[1]}"],);
        return UserAcountWidget();
      default:
        currentTitle = 'Home';
     //   return Home(value: "${widget.acountInfos[0]}");
        return Home(checkEmotion: widget.showEmotionalert,);

    }
    
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage(_page),
      bottomNavigationBar: CurvedNavigationBar(
        // initialIndex: 0,
        index: 0,
        items: <Widget>[
          Icon(Icons.home, size: 25,color: Theme.of(context).primaryColor,),
          Icon(Icons.chat, size: 25,color: Theme.of(context).primaryColor,),
          Icon(Icons.perm_identity, size: 25,color: Theme.of(context).primaryColor,),
        ],
        color: Theme.of(context).accentColor,
        buttonBackgroundColor: Theme.of(context).accentColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
            _currentPage(_page);
          });
        },
      ),
    );
  }
}
