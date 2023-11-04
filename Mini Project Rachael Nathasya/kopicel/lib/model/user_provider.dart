import 'package:flutter/foundation.dart';
import 'package:kopicel/model/user_model.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void updateUser(String id, User updatedUser) {
    final userIndex = _users.indexWhere((user) => user.id == id);
    if (userIndex >= 0) {
      _users[userIndex] = updatedUser;
      notifyListeners();
    }
  }

  void deleteUser(String id) {
    _users.removeWhere((user) => user.id == id);
    notifyListeners();
  }
}
