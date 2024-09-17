import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Sharedstore {
  
  const Sharedstore._();
  static const _isLogged = 'isLogged';
  static const username = 'username';

  static Future<void> setLoggedin(bool loggedvalue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLogged, loggedvalue);
  }

  static Future<bool?> getLoggedin() async {
    final prefs = await SharedPreferences.getInstance();
    log(prefs.getBool(_isLogged).toString());
    return prefs.getBool(_isLogged);
  }

  static Future<void> setUsername(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(username, name);
    log(prefs.getString(username).toString());
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    log(prefs.getString(username).toString());
    return prefs.getString(username);
  }

}
