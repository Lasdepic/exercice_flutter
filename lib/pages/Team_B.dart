import 'package:exercice_flutter/ViewModel/PlayerUser.dart';
import 'package:exercice_flutter/pages/User.dart';
import 'package:exercice_flutter/API/UsersAPI.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTeamB extends StatefulWidget {
  MyTeamB({super.key});

  @override
  State<MyTeamB> createState() => _MyTeamBState();
}

class _MyTeamBState extends State<MyTeamB> {
  List teamB = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future loadUser() async {
    teamB = await PlayerUser().filterTeamB();
    setState(() {
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    final viewModel = Provider.of<PlayerUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Team B"),
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
              title: Text('My Score'),
              onTap: () {
                Navigator.pushNamed(context, '/MyScore');
              },
            ),
          ],
        ),
      ),
      body: viewModel.loading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
                itemCount: viewModel.team.length,
                itemBuilder: (context, index) {
                  final user = viewModel.team[index];
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
                      trailing: Icon(Icons.chevron_right),
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
