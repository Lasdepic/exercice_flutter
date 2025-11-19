import 'package:exercice_flutter/API/UsersAPI.dart';
import 'package:exercice_flutter/Models/Users.dart';
import 'package:http/http.dart';

class PlayerUser {
  Future<List<Users>> getUsers() async {
    return await allUsers.getAllUsers();
  }

  Future<List<Users>> filterTeamA() async {
    final userTeamA = await getUsers();
    return userTeamA.take(10).toList();
  }

  Future<List<Users>> filterTeamB() async {
    final userTeamB = await getUsers();
    return userTeamB.skip(10).take(10).toList();
  }
}
