import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touchstone_app/constants.dart';
import 'package:touchstone_app/room_category.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: bg_color,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 65, right: 52, left: 32),
                height: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yash\'s\nRooms',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Circular',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                          radius: 20,
                          child: ClipRRect(
                            child: Image.asset('assets/images/yash_.jpg'),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: SvgPicture.asset(
                'assets/images/Circles.svg',
                height: 300,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.78,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 27),
                        child: Text(
                          'All Rooms',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RoomCategory(
                                    icon: 'assets/images/bed.svg',
                                    name: 'Bed Room',
                                    room: 4),
                                RoomCategory(
                                    icon: 'assets/images/room.svg',
                                    name: 'Living Room',
                                    room: 2),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RoomCategory(
                                    icon: 'assets/images/kitchen.svg',
                                    name: 'Kitchen',
                                    room: 5),
                                RoomCategory(
                                    icon: 'assets/images/bathtube.svg',
                                    name: 'Bathroom',
                                    room: 1),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RoomCategory(
                                    icon: 'assets/images/house.svg',
                                    name: 'Outdoor',
                                    room: 5),
                                RoomCategory(
                                    icon: 'assets/images/balcony.svg',
                                    name: 'Balcony',
                                    room: 2),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Hero(
                tag: 'connect',
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icon_bulb.svg'),
                      SizedBox(width: 40),
                      SvgPicture.asset('assets/images/icon_home.svg'),
                      SizedBox(width: 40),
                      SvgPicture.asset('assets/images/icon_setting.svg'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
