import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neon/neon.dart';
import 'package:tic_tac_toe/Multiplayer.dart';
import 'package:tic_tac_toe/splash_screen.dart';
import 'Singleplayer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    title: "Tic Tac Toe",
    home: splashscreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with WidgetsBindingObserver{
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
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbar = MediaQuery.of(context).padding.top;
    double appbar = kToolbarHeight;
    double bodyheight = theight - appbar;

    return WillPopScope(onWillPop:
        () {
          return  showExitPopup(context);
        }

        ,child: AnimatedContainer(
      duration: Duration(seconds: 2),
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
          SizedBox(height: theight * 0.09,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return singleplayer();
                },));
              },
              child: Container(
                height: theight * 0.08,
                width: twidth * 0.75,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.blue.withOpacity(0.7)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      height: theight * 0.07,
                      width: twidth * 0.15,
                      child: Icon(Icons.person,
                        color: Colors.white,
                        size: theight * 0.05,
                        shadows: [Shadow(color: Colors.blue,blurRadius: 40)],
                      ),
                    ),
                    Container(
                      height: theight * 0.07,
                      width: twidth * 0.58,
                      child: Align(
                        alignment: Alignment.center,
                        child: DefaultTextStyle(
                          style: TextStyle(),
                          child: Neon(
                            text: 'SINGLE PLAYER',
                            color: Colors.blue,
                            font: NeonFont.Beon,
                            fontSize: theight * 0.030,
                            flickeringText: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: theight * 0.04),
          Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return multiplayer();
                  },));
                },
                child: Container(
                  height: theight * 0.08,
                  width: twidth * 0.75,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.red.withOpacity(0.7)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: theight * 0.07,
                        width: twidth * 0.15,
                        child: Icon(Icons.people,
                          color: Colors.white,
                          size: theight * 0.05,
                          shadows: [Shadow(color: Colors.red,blurRadius: 40)],
                        ),
                      ),
                      Container(
                        height: theight * 0.07,
                        width: twidth * 0.58,
                        child: Align(
                          alignment: Alignment.center,
                          child: DefaultTextStyle(
                            style: TextStyle(),
                            child: Neon(
                              text: 'MULTI PLAYER',
                              color: Colors.red,
                              font: NeonFont.Beon,
                              fontSize: theight * 0.030,
                              flickeringText: false,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),
          SizedBox(height: theight * 0.04),

        ],
      ),
    ));
  }
  Future<bool> showExitPopup(context) async {
    return await showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: Container(
          height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Are You sure Exit This App?"),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: () {
                    print('Yes selected');
                    exit(0);
                  }, child: Text("Yes"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade800),
                  ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(child: ElevatedButton(onPressed: () {
                    print('Yes selected');

                    Navigator.of(context).pop();
                  },
                    child: Text('No', style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white),))
                ],
              )
            ],
          ),
        ),
      );
    },);
  }
}
