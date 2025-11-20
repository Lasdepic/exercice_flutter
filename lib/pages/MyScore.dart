import 'package:exercice_flutter/ViewModel/AddScore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyScore extends StatefulWidget {
  MyScore({super.key});

  @override
  State<MyScore> createState() => _MyScoreState();
}

class _MyScoreState extends State<MyScore> {
  @override
  Widget build(BuildContext context) {
    final addPoint = Provider.of<AddScore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Shink woo Scheeeh"),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: (Drawer(
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
      )),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/Team_A');
                          },
                          child: Text(
                            'TEAM A',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(),
                        SizedBox(height: 30),
                        Container(
                          child: Text(
                            '${addPoint.scoreA}',
                            style: TextStyle(
                              fontSize: 180,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            addPoint.addOnePointA(1);
                          },
                          child: Text('+1 point'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            fixedSize: Size(150, 30),
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            addPoint.addOnePointA(2);
                          },
                          child: Text('+2 points'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            fixedSize: Size(150, 30),
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            addPoint.addOnePointA(3);
                          },
                          child: Text('+3 points'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            fixedSize: Size(150, 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/Team_B');
                          },
                          child: Text(
                            'TEAM B',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(),
                        SizedBox(height: 30),
                        Container(
                          child: Text(
                            '${addPoint.scoreB}',
                            style: TextStyle(
                              fontSize: 180,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            addPoint.addOnePointB(1);
                          },
                          child: Text('+1 point'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            fixedSize: Size(150, 30),
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            addPoint.addOnePointB(2);
                          },
                          child: Text('+2 points'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            fixedSize: Size(150, 30),
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            addPoint.addOnePointB(3);
                          },
                          child: Text('+3 points'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            fixedSize: Size(150, 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Center(
            child: ElevatedButton(
              onPressed: () {
                addPoint.reset();
              },
              child: Text('Réinitialiser'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                fixedSize: Size(180, 50),
              ),
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
