import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SceneCategory extends StatelessWidget {
  const SceneCategory({Key? key, required this.name, required this.bg})
      : super(key: key);
  final String name;
  final Color bg;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          height: 50,
          width: 130,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/surface2.svg',
                height: 20,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
