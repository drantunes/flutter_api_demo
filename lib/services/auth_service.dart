import 'package:flutter/foundation.dart';

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
