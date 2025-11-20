import 'package:exercice_flutter/ViewModel/PlayerUser.dart';
import 'package:exercice_flutter/pages/User.dart';
import 'package:exercice_flutter/API/UsersAPI.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MercatoPage extends StatefulWidget {
  MercatoPage({super.key});

  @override
  State<MercatoPage> createState() => _MercatoPageState();
}

class _MercatoPageState extends State<MercatoPage> {
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PlayerUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Mercato"),
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
                itemCount: viewModel.mercato.length,
                itemBuilder: (context, index) {
                  final user = viewModel.mercato[index];
                  final initials =
                      "${(user.firstName).isNotEmpty ? user.firstName[0] : ''}${user.lastName.isNotEmpty ? user.lastName[0] : ''}"
                          .toUpperCase();
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              minimumSize: Size(64, 36),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            onPressed: () {
                              viewModel.addMercato(index, "A");
                            },
                            child: Text('Team A'),
                          ),
                          SizedBox(width: 8),
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
                          SizedBox(width: 12),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserPage(userId: user.id),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${user.firstName} ${user.lastName}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    user.email,
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              minimumSize: Size(64, 36),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                            ),
                            onPressed: () {
                              viewModel.addMercato(index, "B");
                            },
                            child: Text('Team B'),
                          ),
                          IconButton(
                            icon: Icon(Icons.chevron_right),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UserPage(userId: user.id),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
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
