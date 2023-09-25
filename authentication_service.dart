
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  final SharedPreferences _prefs;

  AuthenticationService(this._prefs);

  Future<bool> login(String username, String password) async {
    if (username == 'user' && password == 'password') {
      await _prefs.setBool('isLoggedIn', true);
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    await _prefs.setBool('isLoggedIn', false);
  }

  bool isLoggedIn() {
    return _prefs.getBool('isLoggedIn') ?? false;
  }
}
