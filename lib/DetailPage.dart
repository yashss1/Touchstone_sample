import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touchstone_app/color_category.dart';
import 'package:touchstone_app/light_category.dart';
import 'package:touchstone_app/scene_category.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'dart:math' as math;

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double num = 4, delay = 0, angle = 0, cont1 = 0;
  double cnum = 0;
  double bnum = 0;
  double slider_value = 0.3;
  Color bulb_color = Colors.yellow.withOpacity(0.3), prev_color = Colors.yellow;
  bool power = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(controller.value);
      angle = controller.value;
      if (controller.value < 0.5) {
        cont1 = controller.value;
      }
      if (controller.value > 0.3) {
        delay = (controller.value * 1.42) - 0.42;
        cnum = delay * 20;
        bnum = delay;
        slider_value = delay;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: SvgPicture.asset(
                'assets/images/Circles.svg',
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: bg_color,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/Circles.svg',
                    height: 500,
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 32, left: 10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    print('pressed');
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/icon_back.svg',
                                    height: 18,
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Bed',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      letterSpacing: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Room',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                letterSpacing: 2,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              '4 Lights',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xffECD750),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      padding: EdgeInsets.only(left: 400 * (1 - bnum)),
                      margin: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: [
                          LightCategory(
                              icon: 'assets/images/surface2.svg',
                              name: 'Main Light',
                              bg1: Colors.white,
                              bg2: Colors.black),
                          LightCategory(
                              icon: 'assets/images/furniture-and-household.svg',
                              name: 'Desk Light',
                              bg1: Color(0xff173b69),
                              bg2: Colors.white),
                          LightCategory(
                              icon: 'assets/images/bed (1).svg',
                              name: 'Bed Light',
                              bg1: Colors.white,
                              bg2: bg_color),
                          LightCategory(
                              icon: 'assets/images/surface2.svg',
                              name: 'Yash Light',
                              bg1: Colors.white,
                              bg2: Colors.black),
                        ],
                      )),
                ],
              ),
            ),
            Positioned(
              top: 200 + (cont1 * 240),
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xfff6f8fc),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.62,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xfff6f8fc),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Intensity',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Stack(
                              children: [
                                Positioned(
                                    top: 10,
                                    left: 0,
                                    child: SvgPicture.asset(
                                        'assets/images/solution2.svg')),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SfSlider(
                                    min: 0.0,
                                    max: 100.0,
                                    activeColor: Color(0xffECD750),
                                    inactiveColor: Colors.grey,
                                    value: slider_value * 100,
                                    interval: 20,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        slider_value = 0.01 * value;
                                        print(slider_value);
                                      });
                                    },
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 10,
                                  child: SvgPicture.asset(
                                    'assets/images/solution1.svg',
                                    color: Color(0xffECD900),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 27),
                        child: Text(
                          'Colors',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  bulb_color = Color(0xffff9a9a);
                                  setState(() {});
                                  print(bulb_color);
                                },
                                child: ColorCategory(color: Color(0xffff9a9a))),
                            SizedBox(width: cnum),
                            InkWell(
                                onTap: () {
                                  bulb_color = Color(0xff93eb9d);
                                  setState(() {});
                                  print(bulb_color);
                                },
                                child: ColorCategory(color: Color(0xff93eb9d))),
                            SizedBox(width: cnum),
                            InkWell(
                                onTap: () {
                                  bulb_color = Color(0xff94caea);
                                  setState(() {});
                                  print(bulb_color);
                                },
                                child: ColorCategory(color: Color(0xff94caea))),
                            SizedBox(width: cnum),
                            InkWell(
                                onTap: () {
                                  bulb_color = Color(0xffa594ec);
                                  setState(() {});
                                  print(bulb_color);
                                },
                                child: ColorCategory(color: Color(0xffa594ec))),
                            SizedBox(width: cnum),
                            InkWell(
                                onTap: () {
                                  bulb_color = Color(0xffde93eb);
                                  setState(() {});
                                  print(bulb_color);
                                },
                                child: ColorCategory(color: Color(0xffde93eb))),
                            SizedBox(width: cnum),
                            InkWell(
                                onTap: () {
                                  bulb_color = Color(0xffead094);
                                  setState(() {});
                                  print(bulb_color);
                                },
                                child: ColorCategory(color: Color(0xffead094))),
                            SizedBox(width: cnum),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: SvgPicture.asset('assets/images/+.svg'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 27),
                        child: Text(
                          'Scenes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SceneCategory(
                            name: 'Birthday',
                            bg: Color(0xffffb193).withOpacity(1),
                          ),
                          SceneCategory(
                            name: 'Party',
                            bg: Color(0xffc993eb),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SceneCategory(
                            name: 'Relax',
                            bg: Color(0xff92cfeb),
                          ),
                          SceneCategory(
                            name: 'Fun',
                            bg: Color(0xff9be191),
                          ),
                        ],
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
            Positioned(
              bottom: MediaQuery.of(context).size.height * .59,
              right: 30,
              child: InkWell(
                onTap: () {
                  if (power == false) {
                    power = true;
                    bulb_color = prev_color;
                    setState(() {});
                  } else {
                    power = false;
                    prev_color = bulb_color;
                    bulb_color = Colors.black;
                    setState(() {});
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      'assets/images/icon_poweroff.svg',
                      height: 25,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -60 * (1 - bnum),
              right: 95,
              child: Container(
                margin: EdgeInsets.only(top: 106),
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: bulb_color != Colors.black
                          ? bulb_color.withOpacity(
                              math.min(1, math.max(slider_value, 0.3)))
                          : Colors.transparent,
                      offset: Offset(0, 1),
                      blurRadius: 7,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -60 * (1 - bnum),
              right: 40,
              child: SvgPicture.asset(
                'assets/images/light bulb.svg',
                color: bulb_color
                    .withOpacity(math.min(1, math.max(slider_value, 0.3))),
              ),
            ),
            Positioned(
              top: -60 * (1 - bnum),
              right: 40,
              child: SvgPicture.asset('assets/images/Group 38.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
