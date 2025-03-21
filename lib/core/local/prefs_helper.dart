import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  // Private constructor
  PrefsHelper._internal();
  // Singleton instance
  static final PrefsHelper _instance = PrefsHelper._internal();
  // Factory constructor to return the same instance
  factory PrefsHelper() => _instance;

  static SharedPreferences? _prefs;

  // Initialize SharedPreferences (call this before using prefs)

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Getter for prefs (ensure it's initialized first)
  static SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception("PrefsHelper.init() must be called before accessing prefs.");
    }
    return _prefs!;
  }

}