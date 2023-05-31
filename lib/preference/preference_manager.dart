import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {

  static final PreferenceManager _instance = PreferenceManager._internal();
  factory PreferenceManager() => _instance;

  SharedPreferences? prefs;

  PreferenceManager._internal() {
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void saveString(String key, String value) {
    prefs?.setString(key, value);
  }

  Future<bool> clearPref(){
    if(prefs != null) {
      return prefs!.clear();
    } else{
      return Future(() => false);
    }
  }

  // void removeUser() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.clear();
  // }

  String? loadString(String key) {

    String? value = prefs?.getString(key);

    return value;
  }

// Future<String?> loadString(String key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? value = prefs.getString(key);
//
//   return value;
// }
//
// void saveBool(String key, bool value) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool(key, value);
// }
//
// Future<bool?> loadBool(String key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool? value = prefs.getBool(key);
//
//   return value;
// }
}