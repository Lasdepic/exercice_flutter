import 'package:exercice_flutter/API/UsersAPI.dart';
import 'package:exercice_flutter/Models/Users.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class PlayerUser extends ChangeNotifier {
  Future<List<Users>> getUsers() async {
    return await allUsers.getAllUsers();
  }

  bool loading = true;
  List<Users> team = [];

  Future<List<Users>> filterTeamA() async {
    final userTeamA = await getUsers();
    final result = userTeamA.take(10).toList();
    team = result;
    loading = false;
    notifyListeners();
    return result;
  }

  Future<List<Users>> filterTeamB() async {
    loading = true;
    notifyListeners();
    final userTeamB = await getUsers();
    final result = userTeamB.skip(10).take(10).toList();
    team = result;
    loading = false;
    notifyListeners();
    return result;
  }
}
