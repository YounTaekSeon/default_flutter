import 'package:youneciohc/preference/preference_manager.dart';

class PreferenceHelper {
  static final String _KEY_LAST_LOGGED_IN_USER = "key_last_logged_in_user";
  static final String _KEY_ACCESS_TOKEN = "key_access_token";
  static final String _KEY_FCM_TOKEN = "key_fcm_token";
  static final String _KEY_DAILY_GOAL = "key_daily_goal";

  static PreferenceManager preferenceManager = PreferenceManager();

  static void init() {
    preferenceManager.init();
  }

  static void saveAccessToken(String token) {
    preferenceManager.saveString(_KEY_ACCESS_TOKEN, token);
  }

  static String? loadAccessToken() {
    return preferenceManager.loadString(_KEY_ACCESS_TOKEN);
  }
}