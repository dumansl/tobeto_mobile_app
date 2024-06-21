import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late SharedPreferences _prefs;

  SharedPreferencesService() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool isFirstTime() {
    return _prefs.getBool('isFirstTime') ?? true;
  }

  Future<void> setFirstTime(bool value) async {
    await _prefs.setBool('isFirstTime', value);
  }

  bool isLoggedIn() {
    return _prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool('isLoggedIn', value);
  }
}
