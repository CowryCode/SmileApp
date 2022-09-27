import 'package:SmileApp/apis/models/countrymodel.dart' as  CD;
import 'package:SmileApp/apis/models/globemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class HappinessMap extends StatefulWidget {
  const HappinessMap({Key? key}) : super(key: key);

  @override
  _HappinessMapState createState() => _HappinessMapState();
}

class _HappinessMapState extends State<HappinessMap> {

  late List<CD.Model> data;
  //late List<Dummy.Model> data1;
  late MapShapeSource sublayerDataSource;
  late MapShapeSource shapeDataSource;

  @override
  void initState() {
    // SET DATA FOR MAP
    GobeModel  gm = GobeModel();
    data = gm.getProcessedcountries(userCountriesIndexString: "0,1,2,3,5,6,7,8,9,10,15,18,23,77,90,100,120")!;
    print("Loaded Data : ${data.toString()}");
    // data1 = <Dummy.Model>[
    //   Dummy.Model('Algeria', "Low"),
    //   Dummy.Model('Nigeria', "High"),
    //   Dummy.Model('Libya', "Low"),
    //   Dummy.Model('Azerbaijan', "Low"),
    //   Dummy.Model('Burkina Faso', "Low"),
    //   Dummy.Model('Afghanistan', "Low"),
    // ];
    // print("Dummy Data ${data1.toString()}");

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



    // WidgetsBinding.instance.addPostFrameCallback((_) async{
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
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
