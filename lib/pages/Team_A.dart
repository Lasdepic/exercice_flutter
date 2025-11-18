import 'dart:ffi';
import 'package:exercice_flutter/API/UsersAPI.dart';
import 'package:flutter/material.dart';

class MyTeamA extends StatefulWidget {
  MyTeamA({super.key});

  @override
  State<MyTeamA> createState() => _MyTeamAState();
}

class _MyTeamAState extends State<MyTeamA> {
  List teamA = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future loadUser() async {
    final user = await allUsers.getAllUsers();
    setState(() {
      teamA = user.take(10).toList();
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NavBar"),
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
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
                itemCount: teamA.length,
                itemBuilder: (context, index) {
                  final user = teamA[index];
                  return ListTile(
                    title: Center(
                      child: Text("${user.firstName} ${user.lastName}"),
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
