import 'dart:convert';

import 'package:bookia/features/auth/data/models/auth_response/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  static late SharedPreferences pref;
  static const kToken = 'token';
  static const kUser = 'user';
  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String value) async {
    await pref.setString(kToken, value);
  }

  static String? getToken() {
    return pref.getString(kToken);
  }

  static Future<void> setUserInfo(User? model) async {
    if (model == null) {
      return;
    }
    // object to Json ==> Using toJson() from the model
    var objToJson = model.toJson();
    // Json to String ==> Using jsonEncoder() from convert library
    var jsonToString = jsonEncode(objToJson);
    await pref.setString(kUser, jsonToString); //caching
  }

  static User? getUserInfo() {
    // get String
    var cachedString = pref.getString(kUser);
    // String to Json ==> Using jsonDecoder() from convert library
    if (cachedString == null) {
      //* if it's null => there's no user so he will return null
      return null;
    }
    var stringToJson = jsonDecode(cachedString);
    // json to Object ==> using fromJson() from the model
    var jsonToObject = User.fromJson(stringToJson);
    return jsonToObject;
  }

  static Future<void> cacheDate(String key, dynamic value) async {
    if (value is String) {
      await pref.setString(key, value);
    } else if (value is int) {
      await pref.setInt(key, value);
    } else if (value is bool) {
      await pref.setBool(key, value);
    } else if (value is double) {
      await pref.setDouble(key, value);
    }
  }

  static Object getData(String key) {
    return pref.get(key) ?? '';
  }

  static Future<void> removeDate(String key) async {
    await pref.remove(key);
  }

  static Future<void> clearData() async {
    await pref.clear();
  }
}
