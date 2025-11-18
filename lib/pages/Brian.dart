import 'package:exercice_flutter/components/MyContainer.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyPageHome"),
        backgroundColor: Colors.amberAccent,
      ),
      drawer: (Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 24, 86, 255),
              ),
              child: Text("Menu"),
            ),
            ListTile(
              title: Text('Exercice Brian'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      )),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 725,
              width: 80,
              color: Color.fromARGB(255, 255, 202, 12),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, '/FlexPage');
                },
                child: Text("retour"),
              ),
            ),
            MyContainer(),
          ],
        ),
      ),
    );
  }
}
