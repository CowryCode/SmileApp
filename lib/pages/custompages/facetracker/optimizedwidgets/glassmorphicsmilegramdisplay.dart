import 'package:SmileApp/pages/custompages/facetracker/optimizedwidgets/smilecounter.dart';
import 'package:SmileApp/pages/custompages/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/pages/custompages/statemanagement/my_app_state.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class GlassmorphicSmilegramDisplay extends StatefulWidget {
  const GlassmorphicSmilegramDisplay({Key? key}) : super(key: key);

  @override
  _GlassmorphicSmilegramDisplayState createState() => _GlassmorphicSmilegramDisplayState();
}

class _GlassmorphicSmilegramDisplayState extends State<GlassmorphicSmilegramDisplay> {

  late List<Model> data;
  late MapShapeSource sublayerDataSource;
  late MapShapeSource shapeDataSource;


  @override
  void initState() {
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
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<MyAppState, SGMessage>(
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
                            child: SmileDurationCounter(),
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
}

class Model {
  const Model(this.state, this.storage);

  final String state;
  final String storage;
}
