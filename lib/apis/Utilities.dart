import 'package:intl/intl.dart';

class Utilities{
  final String AppName = "SmileApp";
  final String Provider_App_Name = "Provider App";


  // GET DATE AND TIME FROM DEVICE
  String getDateFromDevice() {
    DateTime now = DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String date = formatter.format(now);
    //String date = "${now.year}-${now.month}-${now.day}";
    return date;
  }

  String getTimeFromDevice() {
    DateTime now = DateTime.now();
    var formatter = new DateFormat.Hms();
    String time = formatter.format(now);
    //String time = "${now.hour}:${now.minute}:00";
    return time;
  }

  double calculateDurationInSeconds(DateTime startTime, DateTime endTime){
   // DateTime dateEnd = DateTime(endTime.year, endTime.month, endTime.day, endTime.hour, endTime.minute, endTime.second);
   // DateTime dateStart = DateTime(startTime.year, startTime.month, startTime.day, startTime.hour, startTime.minute, startTime.second);
    return endTime.difference(startTime).inMilliseconds / 10;
  }

  int getPercentage({required int value, required int total}){
    return ((value/total)*100).round();
  }
}