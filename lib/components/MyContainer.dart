import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              children: [
                SizedBox(width: 20),
                Container(
                  height: 180,
                  width: 80,
                  color: Color.fromARGB(255, 226, 16, 16),
                ),
                SizedBox(width: 20),
                Container(
                  height: 180,
                  width: 80,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
                SizedBox(width: 20),
                Container(
                  height: 180,
                  width: 80,
                  color: Color.fromARGB(255, 226, 16, 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                SizedBox(width: 20),
                Container(
                  height: 180,
                  width: 80,
                  color: Color.fromARGB(255, 226, 16, 16),
                ),
                SizedBox(width: 20),
                Container(
                  height: 180,
                  width: 80,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
                SizedBox(width: 20),
                Container(
                  height: 180,
                  width: 80,
                  color: Color.fromARGB(255, 226, 16, 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                SizedBox(width: 20),
                Container(
                  height: 180,
                  width: 80,
                  color: Color.fromARGB(255, 226, 16, 16),
                ),
                SizedBox(width: 20),
                Container(
                  height: 180,
                  width: 80,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
                SizedBox(width: 20),
                Container(
                  height: 180,
                  width: 80,
                  color: Color.fromARGB(255, 226, 16, 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
