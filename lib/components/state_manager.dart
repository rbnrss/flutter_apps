import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StateManager extends ChangeNotifier {
  int _index = 0;
  List<Map> salons = [];

  int get index => _index;

  Future<void> getData() async {
    final String response =
        await rootBundle.loadString('assets/salon_data.json');
    final data = json.decode(response)["shops"];
    for (var info in data) {
      addSalon(info);
    }
  }

  void addSalon(Map salon) {
    salons.add(salon);
    notifyListeners();
  }

  void changeIndex(index) {
    _index = index;
    notifyListeners();
  }
}
