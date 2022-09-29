// SG stands for Smile Gram
import 'package:SmileApp/apis/models/globemodel.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class SGMessage{
  final String content;
  final bool updated;
  int tokenIndex ;
  bool iscompleted;
  bool showStartCountDown;
  double smileProbability;

  String? userCountriesIndexString; //"0,1.2,3,4,"
  MapShapeSource? sublayerDataSource;
  //GlobeModel globeModel = GlobeModel();

  SGMessage({required this.content,
    required this.updated,
    this.tokenIndex = 5,
    this.iscompleted = false,
    this.showStartCountDown = true,
    this.smileProbability = 0,
    this.sublayerDataSource,
    this.userCountriesIndexString = "0"
  });

  void setShowCountdown({required bool countDownVisibility}){
    this.showStartCountDown = countDownVisibility;
  }
  void setTokenindex({required int indexcount}){
    this.tokenIndex = indexcount;
  }

  void setSubLayerDataSource({required MapShapeSource subelayerdata}){
    this.sublayerDataSource = subelayerdata;
  }

  void setCountriesID({required String countriesID}){
    this.userCountriesIndexString = countriesID;
  }

  void setCompleted({required bool completed}){
    this.iscompleted = completed;
  }
}