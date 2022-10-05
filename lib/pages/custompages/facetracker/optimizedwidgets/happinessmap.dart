import 'package:SmileApp/models/countrymodel.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class HappinessMap extends StatefulWidget {
  const HappinessMap({Key? key}) : super(key: key);

  @override
  _HappinessMapState createState() => _HappinessMapState();
}

class _HappinessMapState extends State<HappinessMap> {

  late List<Model> data;
  //late List<Dummy.Model> data1;
 // late MapShapeSource sublayerDataSource;
  late MapShapeSource shapeDataSource;

  @override
  void initState() {
    // SET DATA FOR MAP
    // GobeModel  gm = GobeModel();
    // data = gm.getProcessedcountries(userCountriesIndexString: "0,1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17")!;
    // data1 = <Dummy.Model>[
    //   Dummy.Model('Algeria', "Low"),
    //   Dummy.Model('Nigeria', "High"),
    //   Dummy.Model('Libya', "Low"),
    //   Dummy.Model('Azerbaijan', "Low"),
    //   Dummy.Model('Burkina Faso', "Low"),
    //   Dummy.Model('Afghanistan', "Low"),
    // ];

    shapeDataSource = MapShapeSource.asset(
      "assets/world_map.json",
      shapeDataField: 'continent',
    );

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

    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: <Widget>[
          ValueListenableBuilder(
            // valueListenable: counterNotifier,
            valueListenable: smileAppValueNotifier.value.mapdatasource,
            builder: (context, MapShapeSource mapShapeSource, child) {
              return SfMaps(
                layers: <MapShapeLayer>[
                  MapShapeLayer(
                    source: shapeDataSource,
                    sublayers: [
                      MapShapeSublayer(
                        // source: sublayerDataSource,
                        source: mapShapeSource,
                      )
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 5,),
          Container(
            width: MediaQuery.of(context).size.width ,
            // margin: const EdgeInsets.only(left: 5, right: 5, top: 1),
            decoration: BoxDecoration(
              // color:  Colors.black12,
              color: Theme.of(context).primaryColor,
              border: Border.all(
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Completed:  ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontFamily: 'Poppins',
                    fontSize: 12.0,
                  ),
                ),
                Icon(FontAwesomeIcons.solidCircle,color: Colors.green, size: 12 ,),
                Text(
                  "  Today's Target:  ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontFamily: 'Poppins',
                    fontSize: 12.0,
                  ),
                ),
                Icon(FontAwesomeIcons.solidCircle,color: Colors.red, size: 12 ,),
                Text(
                  '  Now:  ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontFamily: 'Poppins',
                    fontSize: 12.0,
                  ),
                ),
                Icon(FontAwesomeIcons.solidCircle,color: Colors.orange, size: 12 ,)
              ],
            ),
          )
        ],
      )


    //   ValueListenableBuilder(
    //     // valueListenable: counterNotifier,
    //     valueListenable: smileAppValueNotifier.value.mapdatasource,
    //     builder: (context, MapShapeSource mapShapeSource, child) {
    //       return SfMaps(
    //         layers: <MapShapeLayer>[
    //           MapShapeLayer(
    //             source: shapeDataSource,
    //             sublayers: [
    //               MapShapeSublayer(
    //                 // source: sublayerDataSource,
    //                 source: mapShapeSource,
    //               )
    //             ],
    //           ),
    //         ],
    //       );
    //     },
    // )
    );
  }


}
