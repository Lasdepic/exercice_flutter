import 'package:exercice_flutter/ViewModel/PlayerUser.dart';
import 'package:exercice_flutter/pages/User.dart';
import 'package:exercice_flutter/API/UsersAPI.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTeamA extends StatefulWidget {
  MyTeamA({super.key});

  @override
  State<MyTeamA> createState() => _MyTeamAState();
}

class _MyTeamAState extends State<MyTeamA> {
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PlayerUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Team A"),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 137, 159, 219),
              ),
              child: Text("Menu"),
            ),
            ListTile(
              title: Text('Exercice Brian'),
              onTap: () {
                Navigator.pushNamed(context, '/brian');
              },
            ),
            ListTile(
              title: Text('Boucle page'),
              onTap: () {
                Navigator.pushNamed(context, '/MaNewPage');
              },
            ),
            ListTile(
              title: Text('Score'),
              onTap: () {
                Navigator.pushNamed(context, '/MyScore');
              },
            ),
            ListTile(
              title: Text('Mercato'),
              onTap: () {
                Navigator.pushNamed(context, '/Mercato');
              },
            ),
          ],
        ),
      ),
      body: viewModel.loading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
                itemCount: viewModel.teamA.length,
                itemBuilder: (context, index) {
                  final user = viewModel.teamA[index];
                  final initials =
                      "${(user.firstName ?? '').isNotEmpty ? user.firstName[0] : ''}${(user.lastName ?? '').isNotEmpty ? user.lastName[0] : ''}"
                          .toUpperCase();
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading:
                          (user.image != null &&
                              (user.image as String).isNotEmpty)
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(user.image),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.orangeAccent,
                              child: Text(
                                initials,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                      title: Text("${user.firstName} ${user.lastName}"),
                      subtitle: Text(user.email),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.redAccent),
                        tooltip: 'Supprimer',
                        onPressed: () {
                          viewModel.deletePlayer(index, "A");
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserPage(userId: user.id),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.orangeAccent,
        tooltip: 'Retour',
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
