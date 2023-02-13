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

    shapeDataSource = MapShapeSource.asset(
      "assets/world_map.json",
      shapeDataField: 'continent',
    );


  }

  @override
  Widget build(BuildContext context) {

    return Padding(
     // padding: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.only(left: 5, right: 5),
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
          //SizedBox(height: 5,),
        ],
      )

    );
  }


}
