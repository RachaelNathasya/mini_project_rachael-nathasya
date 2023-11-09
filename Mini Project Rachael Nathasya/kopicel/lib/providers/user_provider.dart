import 'package:flutter/material.dart';
import 'package:kopicel/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void set user(User? setter) {
    _user = setter;
    notifyListeners();
  }
}
