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

  Future<bool>? saveString(String key, String value) {
    return prefs?.setString(key, value);
  }

  Future<bool> clearAllPref() {
    if (prefs != null) {
      return prefs!.clear();
    } else {
      return Future(() => false);
    }
  }

  Future<bool> removePref(String key) {
    if (prefs != null) {
      return prefs!.remove(key);
    } else {
      return Future(() => false);
    }
  }

  String? loadString(String key) {
    String? value = prefs?.getString(key);

    return value;
  }
}