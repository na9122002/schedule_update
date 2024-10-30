import 'package:flutter/material.dart';
import 'package:wrok_app_1/models/users_model.dart';

class AuthService with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
 Users? _user;

  Users? get user => _user;
  void login() {
    _isLoggedIn = true;
    notifyListeners(); // Thông báo cho các widget lắng nghe
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
   void setUser(Users user) {
    _user = user;
    notifyListeners();
  }
}
