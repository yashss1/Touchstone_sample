import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touchstone_app/screens/DetailPage.dart';

class RoomCategory extends StatelessWidget {
  const RoomCategory(
      {Key? key, required this.icon, required this.name, required this.room})
      : super(key: key);

  final String icon, name;
  final int room;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage();
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        width: MediaQuery.of(context).size.width * 0.4,
        height: 150,
        // color: Colors.pink,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 17, left: 15),
                child: SvgPicture.asset(
                  icon,
                  height: 50,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, top: 1),
                child: Text(
                  '$room Lights',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffECD750),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
