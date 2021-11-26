import 'package:flutter/material.dart';

class CategoryImageButton extends StatelessWidget {
  final String src;
  final String label;

  const CategoryImageButton({Key? key, required this.src, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.network(
            src,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(label),
          ),
        ),
      ],
    );
  }
}
