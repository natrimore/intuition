import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  final String userResult = "USER_RESULT_LIST";
  final String userToken = "USER_TOKEN";

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setResult(List<int> list) async {
    final SharedPreferences prefs = await _prefs;

    var encodedData = json.encode(list);

    print("encoded to save $encodedData");

    await prefs.setString(userResult, encodedData);
  }

  Future<List<int>> getResult() async {
    final SharedPreferences prefs = await _prefs;

    var encodedStr = prefs.getString(userResult);

    if (encodedStr == null) return [];

    List<int> list = json.decode(encodedStr).cast<int>();

    print("asdasd ${list.toString()}");

    return list;
  }

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await _prefs;

    await prefs.setString(userToken, token);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await _prefs;

    var token = prefs.getString(userToken) ?? "";

    return token;
  }
}
