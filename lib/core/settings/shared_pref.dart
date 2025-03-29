// session manager class - set, get, clear
// save session on login google, otp
// custom uid, username, email, logintype, isloggedin

import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _customUIDKey = 'custom_uid';
  static const String _usernameKey = 'username';
  static const String _emailKey = 'email';
  static const String _loginTypeKey = 'login_type';
  static const String _isLoggedInKey = 'is_logged_in';

  // Save Session
  static Future<void> saveUserSession({
    required String customUID,
    required String loginType,
    String? username,
    String? email,
  }) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(_customUIDKey, customUID);
    sharedPref.setString(_loginTypeKey, loginType);
    sharedPref.setBool(_isLoggedInKey, true);

    if (username != null) sharedPref.setString(_usernameKey, username);
    if (email != null) sharedPref.setString(_emailKey, email);
  }

  // Get Session
  static Future<Map<String, dynamic>?> getUserSession() async {
    final sharedPref = await SharedPreferences.getInstance();
    if (!sharedPref.containsKey(_customUIDKey)) return null;

    return {
      'customUID': sharedPref.getString(_customUIDKey),
      'loginType': sharedPref.getString(_loginTypeKey),
      'username': sharedPref.getString(_usernameKey),
      'email': sharedPref.getString(_emailKey),
      'isLoggedIn': sharedPref.getBool(_isLoggedInKey) ?? false,
    };
  }

  // Clear Session
  static Future<void> clearUserSession() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.clear();
  }
}
