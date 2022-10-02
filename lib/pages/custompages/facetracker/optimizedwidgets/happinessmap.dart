import 'package:SmileApp/apis/models/countrymodel.dart';
import 'package:SmileApp/apis/models/globemodel.dart';
import 'package:SmileApp/statemanagement/models/sgmessage.dart';
import 'package:SmileApp/statemanagement/my_app_state.dart';
import 'package:SmileApp/statemanagement/notifiers/notifierCentral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
      child: ValueListenableBuilder(
        // valueListenable: counterNotifier,
        valueListenable: smileAppValueNotifier.value.mapdatasource!,
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


      //   SfMaps(
      //   layers: <MapShapeLayer>[
      //     MapShapeLayer(
      //       source: shapeDataSource,
      //       sublayers: [
      //         MapShapeSublayer(
      //           source: sublayerDataSource,
      //         )
      //       ],
      //     ),
      //   ],
      // ),
    ));
  }


}
