class Utilities{
  final String AppName = "SmileApp";
  final String Provider_App_Name = "Provider App";


  // GET DATE AND TIME FROM DEVICE
  String getDateFromDevice() {
    DateTime now = DateTime.now();
    String date = "${now.year}-${now.month}-${now.day}";
    return date;
  }

  String getTimeFromDevice() {
    DateTime now = DateTime.now();
    String time = "${now.hour}:${now.minute}:00";
    return time;
  }

  double calculateDurationInSeconds(DateTime startTime, DateTime endTime){
    DateTime dateEnd = DateTime(endTime.year, endTime.month, endTime.day, endTime.hour, endTime.minute, endTime.second);
    DateTime dateStart = DateTime(startTime.year, startTime.month, startTime.day, startTime.hour, startTime.minute, startTime.second);



    print("Start time is : ${dateStart.toString()}");
    print("End time is : ${dateEnd.toString()}");
    print("Time Difference iN milliSeconds : ${endTime.difference(startTime).inMilliseconds}");
    print("Time Difference inSeconds : ${endTime.difference(startTime).inMilliseconds /10}");
    return endTime.difference(startTime).inMilliseconds / 10;
  }
}