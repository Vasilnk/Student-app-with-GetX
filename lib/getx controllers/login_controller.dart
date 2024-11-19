import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _isLoggedIn = false;
  String? schoolId;
  String? password;
  String? schoolName;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    schoolId = prefs.getString('schoolId');
    password = prefs.getString('password');
    schoolName = prefs.getString('schoolName');

    if (schoolId != null && password != null) {
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }
    update();
  }

  Future<void> setLogin(String id, String pass, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('schoolId', id);
    await prefs.setString('password', pass);
    await prefs.setString('schoolName', name);

    schoolId = id;
    password = pass;
    _isLoggedIn = true;
    schoolName = name;

    update();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    schoolId = null;
    password = null;
    _isLoggedIn = false;
    schoolName = null;

    update();
  }
}
