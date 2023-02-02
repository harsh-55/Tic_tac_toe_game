import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neon/neon.dart';
import 'package:tic_tac_toe/main.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  List<Color> colorList = [
    Color(0xff171B70),
    Color(0xff410D75),
    Color(0xff032340),
    Color(0xff050340),
    Color(0xff2C0340),
  ];

  List<Alignment> alignmentList = [Alignment.topCenter, Alignment.bottomCenter];
  int index = 0;
  Color bottomColor = Color(0xff092646);
  Color topColor = Color(0xff410D75);
  Alignment begin = Alignment.bottomCenter;
  Alignment end = Alignment.topCenter;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(microseconds: 0),
      () {
        setState(
          () {
            bottomColor = Color(0xff33267C);
          },
        );
      },
    );
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Homepage();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbar = MediaQuery.of(context).padding.top;
    double appbar = kToolbarHeight;
    double bodyheight = theight - appbar;

    return AnimatedContainer(
      duration: Duration(seconds: 3),
      onEnd: () {
        setState(
          () {
            index = index + 1;
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];
          },
        );
      },
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [bottomColor, topColor],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: theight * 0.06,
          ),
          Container(
            height: theight * 0.17,
            width: double.infinity,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DefaultTextStyle(
                style: TextStyle(),
                child: Neon(
                  text: 'TIC TAC TOE',
                  color: Colors.red,
                  font: NeonFont.Beon,
                  fontSize: theight * 0.06,
                  flickeringText: true,
                  flickeringLetters: [0, 1, 2, 4, 5, 6, 8, 9, 10],
                ),
              ),
            ),
          ),
          SizedBox(
            height: theight * 0.05,
          ),
          Container(
            height: theight * 0.23,
            width: twidth * 0.50,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("Image/homephoto.jpg"))),
          ),
          SizedBox(
            height: theight * 0.09,
          ),
          Lottie.asset("animation/24344-retro-loading-bar.json",fit: BoxFit.cover)
        ],
      ),
    );
  }
}
