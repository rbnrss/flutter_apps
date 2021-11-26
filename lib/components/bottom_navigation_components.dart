import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationComponents {
  List<BottomNavigationBarItem> get itemList => _addNavigationItem();

  List<BottomNavigationBarItem> _addNavigationItem() {
    Map<dynamic, String> _iconMap = {
      const Icon(Icons.home): 'Home',
      const Icon(Icons.search): 'Discover',
      const Icon(Icons.schedule): 'Appointments',
      const FaIcon(FontAwesomeIcons.heart): 'Favorites',
    };
    List<BottomNavigationBarItem> itemList = [];
    for (var icon in _iconMap.keys) {
      itemList.add(BottomNavigationBarItem(icon: icon, label: _iconMap[icon]));
    }
    return itemList;
  }
}
