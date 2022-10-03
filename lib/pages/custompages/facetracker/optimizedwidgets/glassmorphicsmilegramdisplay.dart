import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/happinessmap.dart';
import 'package:SmileApp/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/statemanagement/my_app_state.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GlassmorphicSmilegramDisplay extends StatefulWidget {
  const GlassmorphicSmilegramDisplay({Key? key}) : super(key: key);

  @override
  _GlassmorphicSmilegramDisplayState createState() =>
      _GlassmorphicSmilegramDisplayState();
}

class _GlassmorphicSmilegramDisplayState
    extends State<GlassmorphicSmilegramDisplay> {
  // late List<Model> data;
  // late MapShapeSource sublayerDataSource;
  // late MapShapeSource shapeDataSource;
  // CounterNotifier counter = CounterNotifier(value: 5);

  @override
  void initState() {
    // data = <Model>[
    //   Model('Algeria', "Low"),
    //   Model('Nigeria', "High"),
    //   Model('Libya', "Low"),
    //   Model('Azerbaijan', "Low"),
    //   Model('Burkina Faso', "Low"),
    //   Model('Afghanistan', "Low"),
    // ];
    //
    // shapeDataSource = MapShapeSource.asset(
    //   "assets/world_map.json",
    //   shapeDataField: 'continent',
    // );
    //
    // sublayerDataSource = MapShapeSource.asset(
    //   "assets/world_map.json",
    //   shapeDataField: "admin",
    //   dataCount: data.length,
    //   primaryValueMapper: (int index) {
    //     return data[index].state;
    //   },
    //   shapeColorValueMapper: (int index) {
    //     return data[index].storage;
    //   },
    //   shapeColorMappers: [
    //     MapColorMapper(value: "Low", color: Colors.red),
    //     MapColorMapper(value: "High", color: Colors.green)
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: ValueListenableBuilder(
            // valueListenable: counterNotifier,
            valueListenable: smileAppValueNotifier.value.smileDurationCount,
            builder: (context, value, child) {
              return Text(
                "${value.toString()} ",
                style: const TextStyle(
                    fontSize: 33.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
        Align(alignment: Alignment.center, child: HappinessMap()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '   Country Name:',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                ),
              ),
              ValueListenableBuilder(
                // valueListenable: counterNotifier,
                valueListenable: smileAppValueNotifier.value.nextCountry,
                builder: (context, String value, child) {
                  return Text(
                    '   $value',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                    ),
                  );
                },
              ),
            ],
          ),
          // child: Text(
          //   '   Country Name: ',
          //   textAlign: TextAlign.center,
          //   overflow: TextOverflow.ellipsis,
          //   style: const TextStyle(
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black45,
          //     fontFamily: 'Poppins',
          //     fontSize: 14.0,
          //   ),
          // ),
        ),
      ],
    ));
    //     Center(
    //   child: GlassmorphicContainer(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height,
    //     borderRadius: 20,
    //     blur: 20,
    //     alignment: Alignment.bottomCenter,
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
    //     child: Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children:<Widget> [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: <Widget>[
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: <Widget>[
    //                     SizedBox(width: 3,),
    //                     Text(
    //                       'Smile rating is : ',
    //                       textAlign: TextAlign.center,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: const TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.black45,
    //                         fontFamily: 'Poppins',
    //                         fontSize: 14.0,
    //                       ),
    //                     ),
    //                     SizedBox(width: 3,),
    //                     Text(
    //                       (currentMessagestate.smileProbability == 0) ? 'Not started' : '${currentMessagestate.smileProbability}%',
    //                       textAlign: TextAlign.center,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: const TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.red,
    //                         fontSize: 12.0,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                  SizedBox(
    //                    height: 40,
    //                    child: ValueListenableBuilder(
    //                     // valueListenable: counterNotifier,
    //                      valueListenable: smileAppValueNotifier.value.smileDurationCount,
    //                      builder: (context, value, child) {
    //                        return Text("${value.toString()}",
    //                          style: const TextStyle(
    //                              fontSize: 33.0,
    //                              color: Colors.green,
    //                              fontWeight: FontWeight.bold),
    //                        );
    //                      },
    //                    ),
    //                  ),
    //               ],
    //             ),
    //             HappinessMap()
    //           ],
    //         )
    //       //child: _smilegramDetector()
    //     ),
    //   ),
    // ));
  }
}

// class Model {
//   const Model(this.state, this.storage);
//
//   final String state;
//   final String storage;
// }
