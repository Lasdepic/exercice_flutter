import 'package:exercice_flutter/API/UsersAPI.dart';
import 'package:exercice_flutter/Models/Users.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final int userId;
  const UserPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Users? user;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future loadUser() async {
    final u = await allUsers.getUserById(widget.userId);
    setState(() {
      user = u;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 137, 159, 219),
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Exercice Brian'),
              onTap: () {
                Navigator.pushNamed(context, '/brian');
              },
            ),
            ListTile(
              title: const Text('Boucle page'),
              onTap: () {
                Navigator.pushNamed(context, '/MaNewPage');
              },
            ),
            ListTile(
              title: const Text('My Score'),
              onTap: () {
                Navigator.pushNamed(context, '/MyScore');
              },
            ),
          ],
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: user == null
                  ? const Text('Aucun utilisateur trouvé')
                  : Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 12),
                          Image.network(user!.image, height: 100, width: 100),
                          SizedBox(height: 12),
                          Text(
                            '${user!.firstName} ${user!.lastName}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Age : ${user!.age} ans',
                            style: const TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Email : ${user!.email}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.orangeAccent,
        tooltip: 'Retour',
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
