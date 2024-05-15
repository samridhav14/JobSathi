import 'package:flutter/material.dart';


class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;
   get obscureText => _obscureText;
  void toggleObscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }
}
