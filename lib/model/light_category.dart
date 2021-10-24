import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LightCategory extends StatelessWidget {
  const LightCategory(
      {Key? key,
      required this.icon,
      required this.name,
      required this.bg1,
      required this.bg2})
      : super(key: key);
  final String icon, name;
  final Color bg1, bg2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(8),
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: bg1,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 20,
            color: bg2,
          ),
          SizedBox(width: 10),
          Text(
            name,
            style: TextStyle(color: bg2),
          ),
        ],
      ),
    );
  }
}
