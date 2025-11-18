import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jordan')),
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
            ListTile(title: Text('Exercice Brian'), onTap: () {}),
          ],
        ),
      )),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 202, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: const Color.fromARGB(255, 28, 1, 231),
                    child: Text(
                      "1",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Text(
                      "2",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: const Color.fromARGB(255, 255, 0, 0),
                    child: Text(
                      "3",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              height: 200,
              width: double.infinity,
              color: const Color.fromARGB(255, 231, 1, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 70,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Text(
                      "4",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: double.infinity,
              color: const Color.fromARGB(255, 0, 94, 255),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 70,
                    color: const Color.fromARGB(255, 255, 242, 0),
                    child: Text(
                      "4",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 80,
                    width: 100,
                    color: const Color.fromARGB(255, 255, 0, 0),

                    child: Text(
                      "4",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
