import 'package:http/http.dart' as http;
import 'package:kopicel/model/user_model.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

class UserApi {
  static const baseUrl = 'https://654c5eeb77200d6ba858c78f.mockapi.io/users';

  static Future<List<User>> getUsers() async {
    final uri = Uri.parse(baseUrl);
    final res = await http.get(uri);
    final body = res.body;
    final json = const JsonDecoder().convert(body) as List<dynamic>;
    final users = json
        .map((user) => User(
            id: user['id'],
            email: user['email'],
            password: user['password'],
            name: user['name'],
            avatar: user['avatar']))
        .toList();
    return users;
  }

  static Future<User?> verifyUser(String email, String password) async {
    final users = await getUsers();

    final user = users.firstWhereOrNull((user) => user.email == email);

    if (user == null) return null;

    final isPasswordMatch = user.password == password;

    if (!isPasswordMatch) return null;

    return user;
  }

  static Future<User> getUser(String id) async {
    final uri = Uri.parse('$baseUrl/$id');
    final res = await http.get(uri);
    final body = const JsonDecoder().convert(res.body);
    final user = User(
        id: body['id'],
        email: body['email'],
        password: body['password'],
        name: body['name'],
        avatar: body['avatar']);
    return user;
  }

  static Future<User?> updateUser(String id, String email, String name) async {
    Map<String, dynamic> data = {
      'email': email,
      'name': name,
    };

    final uri = Uri.parse('$baseUrl/$id');

    final res = await http.put(uri,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json'
        },
        body: json.encode(data));

    final body = const JsonDecoder().convert(res.body);
    final user = User(
        id: body['id'],
        email: body['email'],
        password: body['password'],
        name: body['name'],
        avatar: body['avatar']);
    return user;
  }

  static Future<bool> deleteUser(String id) async {
    final uri = Uri.parse('$baseUrl/$id');
    final res = await http.delete(uri);

    return res.statusCode == 200;
  }

  static Future<User> createUser(
      String name, String email, String password) async {
    final uri = Uri.parse(baseUrl);

    Map<String, String> data = {
      'name': name,
      'email': email,
      'password': password
    };

    final res = await http.post(uri,
        headers: {
          'content-type': 'application/json',
          'accept': 'applicaton/json'
        },
        body: jsonEncode(data));

    final body = const JsonDecoder().convert(res.body);
    final user = User(
        id: body['id'],
        email: body['email'],
        password: body['password'],
        name: body['name'],
        avatar: body['avatar']);
    return user;
  }
}
