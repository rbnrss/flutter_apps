import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class SliverAppBarComponents extends StatelessWidget {
  final IconData icon;
  final String label;

  const SliverAppBarComponents(
      {Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          icon.runtimeType == IconData
              ? Icon(icon, color: kCustomBlue)
              : FaIcon(
                  icon,
                  color: kCustomBlue,
                ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              label,
              style: const TextStyle(color: Colors.black, fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }
}
