import 'package:SmileApp/statemanagement/notifiers/SGmessageModel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassmorphicReadMessage extends StatefulWidget {
  const GlassmorphicReadMessage({Key? key}) : super(key: key);

  @override
  _GlassmorphicReadMessageState createState() => _GlassmorphicReadMessageState();
}

class _GlassmorphicReadMessageState extends State<GlassmorphicReadMessage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                child:  AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: ValueListenableBuilder(
                    valueListenable: messageNotifier,
                    builder: (context, SGmessageModel sgmodel, child) {
                      return Text(
                        sgmodel.msg,
                        // key: ValueKey<int>(_count),
                        style: Theme.of(context).textTheme.subtitle2,
                      );
                    },
                  ),
                ),
              ),
            ),
            // SingleChildScrollView(
            //   child: GlassmorphicContainer(
            //     width: MediaQuery.of(context).size.width * 0.90,
            //     height: MediaQuery.of(context).size.height * 0.85,
            //     borderRadius: 20,
            //     blur: 1,
            //     alignment: Alignment.topCenter,
            //     border: 2,
            //     linearGradient: LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //         colors: [
            //           Color(0xFFffffff).withOpacity(0.1),
            //           Color(0xFFFFFFFF).withOpacity(0.05),
            //         ],
            //         stops: [
            //           0.1,
            //           1,
            //         ]),
            //     borderGradient: LinearGradient(
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //       colors: [
            //         Color(0xFFffffff).withOpacity(0.5),
            //         Color((0xFFFFFFFF)).withOpacity(0.5),
            //       ],
            //     ),
            //     child: Padding(
            //       padding: EdgeInsets.all(15),
            //       child: Center(
            //         child:  AnimatedSwitcher(
            //           duration: const Duration(milliseconds: 500),
            //           transitionBuilder: (Widget child, Animation<double> animation) {
            //             return ScaleTransition(scale: animation, child: child);
            //           },
            //           child: ValueListenableBuilder(
            //             valueListenable: messageNotifier,
            //             builder: (context, SGmessageModel sgmodel, child) {
            //               return Text(
            //                 sgmodel.msg,
            //                 // key: ValueKey<int>(_count),
            //                 style: Theme.of(context).textTheme.subtitle2,
            //               );
            //             },
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
