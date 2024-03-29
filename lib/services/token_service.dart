// ignore_for_file: depend_on_referenced_packages

import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  Future<bool> isTokenExist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool exist = prefs.containsKey('token');
    return exist;
  }

  Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('isIntegrated');
  }

  void setTokenValue(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?>? getTokenValue() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  void setIsIntegratedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isIntegrated', true);
  }

  Future<bool?>? getIsIntegratedValue() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isIntegrated');
  }
}
