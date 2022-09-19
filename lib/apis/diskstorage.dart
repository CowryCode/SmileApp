

import 'package:shared_preferences/shared_preferences.dart';

class Localstorage  {
  String? stringval;


  Localstorage({this.stringval});

  // Save meta data
  void saveString(String key, String value) async{
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  void saveInteger(String key, int value) async{
    final pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  void saveDouble(String key, double value) async{
    final pref = await SharedPreferences.getInstance();
    pref.setDouble(key, value);
  }

  void saveBoolean(String key, bool value) async{
    final pref = await SharedPreferences.getInstance();
    pref.setBool(key, value);
  }

  // Get meta data
  Future<String?> getString(String key) async{
    final pref = await SharedPreferences.getInstance();
     this.stringval  = pref.getString(key);

    print("The localValue its 01 ${this.stringval}");
    return pref.getString(key)?? null;
  }

  String? getStringvalue(String key){
    Future<String?> future = getString(key);
    future.whenComplete(() => {
      //ljfkvj vjdlfj
    });
    return this.stringval;
  }

  void setString(String val){
    this.stringval = val;
  }


  Future<int?> getInteger(String key) async{
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(key);
  }

  Future<double?> getDouble(String key) async{
    final pref = await SharedPreferences.getInstance();
    return pref.getDouble(key);
  }

  Future<bool?> getBoolean(String key) async{
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  Future<bool> getBooleanNotNullable(String key) async{
    final pref = await SharedPreferences.getInstance();
      return pref.getBool(key) ?? false;
  }

  // Remove meta data
  void removeItem(String key) async{
    final pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
}