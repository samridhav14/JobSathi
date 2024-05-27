import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_sathi/constants/app_constants.dart';
import 'package:job_sathi/models/request/auth/login_model.dart';
import 'package:job_sathi/services/helpers/auth_helper.dart';
import 'package:job_sathi/views/ui/auth/update_user.dart';
import 'package:job_sathi/views/ui/mainscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  get profileFormKey => null;
  void toggleObscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  bool _firstTime = true;
  bool get firstTime => _firstTime;
  set firstTime(bool value) {
    _firstTime = value;
    notifyListeners();
  }

  bool? _entrypoint;
  bool get entrypoint => _entrypoint ?? false;
  set entrypoint(bool value) {
    _entrypoint = value;
    notifyListeners();
  }

  bool? _loggedIn;
  bool get loggedin => _loggedIn ?? false;
  set loggedin(bool value) {
    _loggedIn = value;
    notifyListeners();
  }

  Future<void> getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    entrypoint = prefs.getBool('entrypoint') ?? false;
    loggedin = prefs.getBool('loggedIn') ?? false;
  }

  final loginFormKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = loginFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future<void> userLogin(LoginModel model) async {
    try {
      
      bool response = await AuthHelper.login(model);
      if (response && firstTime) {
        Get.off(() => const PersonalDetails());
      } else if (response && !firstTime) {
        Get.off(() => const MainScreen());
      } 
      else if (!response) {
        Get.snackbar("Sign Failed", "Please Check your credentials",
            colorText: Color(kLight.value),
            backgroundColor: Colors.red,
            icon: const Icon(Icons.add_alert));
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred during login",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error));
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', false);
    await prefs.remove('token');
    _firstTime = false;
    notifyListeners();
  }
}
