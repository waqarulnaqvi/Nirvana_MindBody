import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {

  // Singleton instance
  static final PrefsHelper _instance = PrefsHelper._internal();
  factory PrefsHelper() => _instance;
  PrefsHelper._internal();

  static SharedPreferences? _prefs;

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // Retrieve a boolean value
  Future<bool> getBoolValue(String key) async
  {
    await init();
    return _prefs?.getBool(key) ?? false;
  }

  // Save a boolean value
  Future<void> setBoolValue(String key, bool value) async {
    await init();
    await _prefs?.setBool(key, value);
  }

}
