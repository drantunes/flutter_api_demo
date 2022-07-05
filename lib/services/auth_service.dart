import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  bool isAuthenticated = false;

  login() {
    isAuthenticated = true;
    notifyListeners();
  }

  logout() {
    isAuthenticated = false;
    notifyListeners();
  }
}
