import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper : initialized');
  }

  static Future<SharedPreferences> _getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<void> removeData(String key) async {
    final prefs = await _getPrefs();
    debugPrint('SharedPrefHelper : removing key : $key');
    await prefs.remove(key);
  }

  static Future<void> clearAllData() async {
    final prefs = await _getPrefs();
    debugPrint('SharedPrefHelper : clearing all data');
    await prefs.clear();
  }

  static Future<void> setData(String key, dynamic value) async {
    final prefs = await _getPrefs();
    debugPrint("SharedPrefHelper : setData key: $key value: $value");
    switch (value.runtimeType) {
      // ignore: type_literal_in_constant_pattern
      case String:
        await prefs.setString(key, value);
        break;
      // ignore: type_literal_in_constant_pattern
      case int:
        await prefs.setInt(key, value);
        break;
      // ignore: type_literal_in_constant_pattern
      case bool:
        await prefs.setBool(key, value);
        break;
      // ignore: type_literal_in_constant_pattern
      case double:
        await prefs.setDouble(key, value);
        break;
      default:
        return;
    }
  }

  static Future<bool> getBool(String key) async {
    final prefs = await _getPrefs();
    return prefs.getBool(key) ?? false;
  }

  static Future<double> getDouble(String key) async {
    final prefs = await _getPrefs();
    return prefs.getDouble(key) ?? 0.0;
  }

  static Future<int> getInt(String key) async {
    final prefs = await _getPrefs();
    return prefs.getInt(key) ?? 0;
  }

  static Future<String> getString(String key) async {
    final prefs = await _getPrefs();
    return prefs.getString(key) ?? '';
  }

  static Future<void> setJsonList(String key, List<Map<String, dynamic>> value) async {
    final prefs = await _getPrefs();
    debugPrint('SharedPrefHelper : setJsonList key: $key');
    await prefs.setString(key, jsonEncode(value));
  }

  static Future<List<Map<String, dynamic>>?> getJsonList(String key) async {
    final prefs = await _getPrefs();
    debugPrint('SharedPrefHelper : getJsonList key: $key');
    final String? jsonString = prefs.getString(key);
    if (jsonString == null || jsonString.isEmpty) return null;
    final List decoded = jsonDecode(jsonString);
    return decoded.cast<Map<String, dynamic>>();
  }

  static Future<void> setJson(String key, Map<String, dynamic> value) async {
    final prefs = await _getPrefs();
    await prefs.setString(key, jsonEncode(value));
  }

  static Future<Map<String, dynamic>?> getJson(String key) async {
    final prefs = await _getPrefs();
    final String? jsonString = prefs.getString(key);
    if (jsonString == null || jsonString.isEmpty) return null;
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  // static Future<void> setSecuredString(String key, String value) async {
  //   const flutterSecureStorage = FlutterSecureStorage();
  //   await flutterSecureStorage.write(key: key, value: value);
  // }

  // static Future<String> getSecuredString(String key) async {
  //   const flutterSecureStorage = FlutterSecureStorage();
  //   return await flutterSecureStorage.read(key: key) ?? '';
  // }

  // static Future<void> clearAllSecuredData() async {
  //   const flutterSecureStorage = FlutterSecureStorage();
  //   await flutterSecureStorage.deleteAll();
  // }
}