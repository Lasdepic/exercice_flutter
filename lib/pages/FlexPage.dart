import 'package:flutter/material.dart';

class FlexPage extends StatefulWidget {
  const FlexPage({super.key});

  @override
  State<FlexPage> createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NavBar"),
        backgroundColor: const Color.fromARGB(255, 24, 86, 255),
      ),
      drawer: (Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
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
      )),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.cyanAccent,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Brian');
                },
                child: Text("Brian"),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 12, 72, 121),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 12, 72, 121),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: () {
                      Navigator.pushNamed(context, '/brian');
                    },
                    child: Container(
                      color: const Color.fromARGB(255, 12, 72, 121),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.blue)),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 225, 175, 8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
