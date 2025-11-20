import 'package:flutter/material.dart';

class AddScore extends ChangeNotifier {
  int scoreA = 0;
  int scoreB = 0;

  void addOnePointA(int point) {
    scoreA += point;
    notifyListeners();
  }

  void addOnePointB(int point) {
    scoreB += point;
    notifyListeners();
  }

  void reset() {
    scoreA = 0;
    scoreB = 0;
    notifyListeners();
  }
}
