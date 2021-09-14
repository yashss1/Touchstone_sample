import 'package:flutter/material.dart';

class ColorCategory extends StatelessWidget {
  const ColorCategory({Key? key, required this.color}) : super(key: key);

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
    );
  }
}
