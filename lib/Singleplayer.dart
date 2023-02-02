

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neon/neon.dart';
import 'package:tic_tac_toe/main.dart';

class singleplayer extends StatefulWidget {
  const singleplayer({Key? key}) : super(key: key);

  @override
  State<singleplayer> createState() => _singleplayerState();
}

class _singleplayerState extends State<singleplayer> {

  List h = ['', '', '', '', '', '', '', '', ''];
  int z = 0 ;

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

    return WillPopScope(
      child: Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
              splashRadius: 20,
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return Homepage();
                },));
              }, icon: Icon(Icons.arrow_back_sharp,size: 28)),
        ),
        elevation: 0,
        backgroundColor: Color(0xff33267C),
        title: Text("        Tic Tac Toe",style: TextStyle(fontSize:25,shadows: [Shadow(color:Colors.red,blurRadius: 40)])),
      ),
      body: AnimatedContainer(
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
        child: Container(
          height: theight,
          width: twidth,
          child: Column(
            children: [
              SizedBox(height: theight * 0.04),
              Container(
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
              Container(
                height: theight * 0.1,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "$a",
                    style: TextStyle(
                        shadows: [Shadow(blurRadius: 40, color: Colors.white)],
                        color: Colors.indigo,
                        fontSize: theight * 0.068,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: theight * 0.45,
                  width: twidth * 0.94,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(h[0]==""){
                                  h[0]="X";
                                  z++;
                                  if(z<=4) {
                                    randomm();
                                  }
                                }

                              });
                              win();
                            },
                            child: Container(
                              height: theight * 0.15,
                              width: twidth * 0.31,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  border:
                                  Border.all(color: Colors.white, width: 5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text("${h[0]}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 70,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(h[1]==""){
                                  h[1]="X";
                                  z++;
                                  if(z<=4) {
                                    randomm();
                                  }
                                }
                              });
                              win();
                            },
                            child: Container(
                              height: theight * 0.15,
                              width: twidth * 0.31,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                border: Border.all(color: Colors.white, width: 5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("${h[1]}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 70,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(h[2]==""){
                                  h[2]="X";
                                  z++;
                                  if(z<=4) {
                                    randomm();
                                  }
                                }
                              });
                              win();
                            },
                            child: Container(
                              height: theight * 0.15,
                              width: twidth * 0.31,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                border: Border.all(color: Colors.white, width: 5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("${h[2]}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 70,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(h[3]==""){
                                  h[3]="X";
                                  z++;
                                  if(z<=4) {
                                    randomm();
                                  }
                                }
                              });
                              win();
                            },
                            child: Container(
                              height: theight * 0.15,
                              width: twidth * 0.31,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  border:
                                  Border.all(color: Colors.white, width: 5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text("${h[3]}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 70,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(h[4]==""){
                                  h[4]="X";
                                  z++;
                                  if(z<=4) {
                                    randomm();
                                  }
                                }
                              });
                              win();
                            },
                            child: Container(
                              height: theight * 0.15,
                              width: twidth * 0.31,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                border: Border.all(color: Colors.white, width: 5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("${h[4]}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 70,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(h[5]==""){
                                  h[5]="X";
                                  z++;
                                  if(z<=4){
                                    randomm();
                                  }
                                }
                                win();
                              });

                            },
                            child: Container(
                              height: theight * 0.15,
                              width: twidth * 0.31,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                border: Border.all(color: Colors.white, width: 5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("${h[5]}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 70,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(h[6]==""){
                                  h[6]="X";
                                  z++;
                                  if(z<=4) {
                                    randomm();
                                  }
                                }

                              });
                              win();
                            },
                            child: Container(
                              height: theight * 0.15,
                              width: twidth * 0.31,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  border:
                                  Border.all(color: Colors.white, width: 5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text("${h[6]}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 70,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(h[7]==""){
                                  h[7]="X";
                                  z++;
                                  if(z<=4) {
                                    randomm();
                                  }
                                }
                              });
                              win();
                            },
                            child: Container(
                              height: theight * 0.15,
                              width: twidth * 0.31,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                border: Border.all(color: Colors.white, width: 5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("${h[7]}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 70,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if(h[8]==""){
                                  h[8]="X";
                                  z++;
                                  if(z<=4) {
                                    randomm();
                                  }
                                }
                              });
                              win();
                            },
                            child: Container(
                              height: theight * 0.15,
                              width: twidth * 0.31,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                border: Border.all(color: Colors.white, width: 5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("${h[8]}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 70,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: theight * 0.05,),
              InkWell(
                onTap: () {
                  refrshh();
                },
                child: Icon(Icons.refresh,
                    size: theight * 0.08,
                    color: Colors.amber,
                    shadows: [
                      Shadow(color: Colors.amber.shade50, blurRadius: 60),
                    ]),
              )
            ],
          ),
        ),
      ),
    ), onWillPop: () {
      return showExitPopup(context);
    },);
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: Container(
          height: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("Image/sademoji-removebg-preview.png")
                    )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text(
                  "Do you want to leave?",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1.5,
              ),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: () {
                    print('Yes selected');
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                     return Homepage();
                   },));
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

  String a = "";
  void win() {
    if (h[0] == "X" && h[1] == "X" && h[2] == "X" ||
        h[3] == "X" && h[4] == "X" && h[5] == "X" ||
        h[6] == "X" && h[7] == "X" && h[8] == "X" ||
        h[0] == "X" && h[3] == "X" && h[6] == "X" ||
        h[1] == "X" && h[4] == "X" && h[7] == "X" ||
        h[2] == "X" && h[5] == "X" && h[8] == "X" ||
        h[0] == "X" && h[4] == "X" && h[8] == "X" ||
        h[2] == "X" && h[4] == "X" && h[6] == "X") {
      setState(() {
        dialoguee();
        a = "X is Win";
      });
    } else if (h[0] == "O" && h[1] == "O" && h[2] == "O" ||
        h[3] == "O" && h[4] == "O" && h[5] == "O" ||
        h[6] == "O" && h[7] == "O" && h[8] == "O" ||
        h[0] == "O" && h[3] == "O" && h[6] == "O" ||
        h[1] == "O" && h[4] == "O" && h[7] == "O" ||
        h[2] == "O" && h[5] == "O" && h[8] == "O" ||
        h[0] == "O" && h[4] == "O" && h[8] == "O" ||
        h[2] == "O" && h[4] == "O" && h[6] == "O") {
      setState(() {
        dialoguee();
        a = "O IS WIN";
      });
    }
    // else if(){
    //   a="!Draw";
    // }


    else if (z == 4) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Draw"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    refrshh();
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        },
      );
    }
  }
  void dialoguee() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Play Continue"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    h[0] = "";
                    h[1] = "";
                    h[2] = "";
                    h[3] = "";
                    h[4] = "";
                    h[5] = "";
                    h[6] = "";
                    h[7] = "";
                    h[8] = "";
                    z = 0;
                    a = "";
                  });
                },
                child: Text("Yes")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return Homepage();
                  },));
                },
                child: Text("No"))
          ],
        );
      },
    );
  }
  void refrshh() {
    setState(() {
      h = ['', '', '', '', '', '', '', '', ''];
      a = "";
      z = 0;
    });
  }
  void randomm(){
    setState(() {
      while(true)
      {
        int r = Random().nextInt(9);
        if(h[r]==""){
          h[r]="O";
          break;
        }
      }
    });
  }
}
