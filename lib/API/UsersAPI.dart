import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:exercice_flutter/Models/Users.dart';

class allUsers {
  static Future<List<Users>> getAllUsers() async {
    final Uri endpoint = Uri.parse('https://dummyjson.com/users');

    final response = await http.get(endpoint);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<Users> users = [];

      for (var user in data["users"]) {
        users.add(
          Users(
            user['id'],
            user['image'],
            user['firstName'],
            user['lastName'],
            user['age'],
            user['email'],
          ),
        );
      }

      return users;
    } else {
      throw HttpException("Oup's une erreur est survenue sur le serveur");
    }
  }

  static Future<Users> getUserById(int id) async {
    final Uri endpoint = Uri.parse('https://dummyjson.com/users/$id');

    final response = await http.get(endpoint);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Users(
        data['id'],
        data['image'],
        data['firstName'],
        data['lastName'],
        data['age'],
        data['email'],
      );
    } else {
      throw HttpException("Oup's une erreur est survenue sur le serveur");
    }
  }
}

// https://docs.flutter.dev/app-architecture/design-patterns/result
