import 'package:exercice_flutter/API/UsersAPI.dart';
import 'package:exercice_flutter/Models/Users.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class PlayerUser extends ChangeNotifier {
  Future<List<Users>> getUsers() async {
    return await allUsers.getAllUsers();
  }

  bool loading = true;
  List<Users> teamA = [];
  List<Users> teamB = [];
  List<Users> mercato = [];

  Future<List<Users>> filterTeamA() async {
    final userTeamA = await getUsers();
    final result = userTeamA.take(10).toList();
    teamA = result;
    loading = false;
    notifyListeners();
    return result;
  }

  Future<List<Users>> filterTeamB() async {
    loading = true;
    notifyListeners();
    final userTeamB = await getUsers();
    final result = userTeamB.skip(10).take(10).toList();
    teamB = result;
    loading = false;
    notifyListeners();
    return result;
  }

  Future<List<Users>> mercatoPlayer() async {
    loading = true;
    notifyListeners();
    final userMercato = await getUsers();
    final result = userMercato.skip(20).take(40).toList();
    mercato = result;
    loading = false;
    notifyListeners();
    return result;
  }

  Future<List<Users>> deletePlayer(int index, String team) async {
    final Users player;
    loading = true;
    notifyListeners();
    if (team == 'A') {
      player = teamA.removeAt(index);
    } else if (team == 'B') {
      player = teamB.removeAt(index);
    } else {
      loading = false;
      notifyListeners();
      return mercato;
    }
    mercato.add(player);
    loading = false;
    notifyListeners();
    return mercato;
  }

  Future<List<Users>> addMercato(int index, String team) async {
    final Users player;
    loading = true;
    notifyListeners();

    if (team == 'A') {
      player = mercato.removeAt(index);
      teamA.add(player);
    } else if (team == 'B') {
      player = mercato.removeAt(index);
      teamB.add(player);
    } else {
      loading = false;
      notifyListeners();
      return mercato;
    }

    loading = false;
    notifyListeners();
    return mercato;
  }
}
