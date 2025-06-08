import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../models/user.dart';

class UserService {
  static const String _assetPath = 'assets/data/Users.json';
  static const String _filename = 'Users.json';

  static Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/$_filename');

    if (!(await file.exists())) {
      final content = await rootBundle.loadString(_assetPath);
      await file.writeAsString(content);
    }

    return file;
  }

  static Future<List<User>> getUsers() async {
    try {
      final file = await _getLocalFile();
      final contents = await file.readAsString();
      final List<dynamic> jsonData = json.decode(contents);
      return jsonData.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      print("Error al leer usuarios: $e");
      return [];
    }
  }

  static Future<void> saveUsers(List<User> users) async {
    final file = await _getLocalFile();
    final jsonData = users.map((user) => user.toJson()).toList();
    await file.writeAsString(json.encode(jsonData));
  }


  static Future<void> addUser(User newUser) async {
    final users = await getUsers();
    users.add(newUser);
    await saveUsers(users);
  }


  static Future<bool> login(String email, String password) async {
    final users = await getUsers();
    return users.any((user) =>
        user.email == email.trim() && user.password == password.trim());
  }


  static Future<bool> emailExists(String email) async {
    final users = await getUsers();
    return users.any((user) => user.email == email.trim());
  }
}
