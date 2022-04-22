import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpuzzle1/modelclaass.dart';
import 'package:mathpuzzle1/winpage.dart';

class stage1 extends StatefulWidget {
  int level;

  stage1(this.level);

  @override
  _stage1State createState() => _stage1State();
}

class _stage1State extends State<stage1> {
  String f1 = "myfamily";

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery
        .of(context)
        .size
        .height;
    double twidth = MediaQuery
        .of(context)
        .size
        .width;
    double statusbarheight = MediaQuery
        .of(context)
        .padding
        .top;
    double naviheight = MediaQuery
        .of(context)
        .padding
        .bottom;
    double toolbarheight = kToolbarHeight;
    double bodyheight = theight - statusbarheight - toolbarheight - naviheight;
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/gameplaybackground.jpg"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              height: toolbarheight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    model.imglist[widget.level] = "skip";
                    model.pref!.setString("status${widget.level}", "skip");
                    setState(() {
                      widget.level++;
                    });
                    model.pref!.setInt("level", widget.level);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) {
                      return stage1(widget.level);
                    },));
                  },
                  child: Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/skip.png"))),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 220,
                  child: Text(
                    "Leval ${widget.level + 1}",
                    style: TextStyle(
                        fontSize: 41, fontFamily: f1, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("image/level_board.png"))),
                ),
                Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                      image:
                      DecorationImage(image: AssetImage("image/hint.png"))),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                setState(() async {});
              },
              child: Container(
                height: theight * .50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image/p${widget.level + 1}.png"))),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: toolbarheight,
                    width: 200,
                    child: Text(
                      "${b1}",
                      style: TextStyle(fontSize: 36, fontFamily: f1),
                    ),
                    alignment: Alignment.center,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      b1 = b1.substring(0, b1.length - 1);
                    });
                  },
                  child: Container(
                    height: toolbarheight,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/delete.png"))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // for(int i = 0 ;i < 75; i++ )
                    //   {
                    //
                    //     int levelanswer = i ;
                    //
                    //   }
                    if (b1 == answer[widget.level]) {
                      String levelstatus = model.imglist[widget.level];
                      if (levelstatus == "clear") {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) {
                          return winpage(widget.level);
                        },));
                      }
                      else if (levelstatus == "skip") {
                        model.imglist[widget.level] = "clear";
                        model.pref!.setString("status${widget.level}", "clear");
                        model.imglist[widget.level] = "skip";
                        model.pref!.setInt("level", widget.level);
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) {
                          return winpage(widget.level);
                        },));
                      }
                      else {
                        model.imglist[widget.level];
                        model.pref!.setString("status${widget.level}", "clear");
                        setState(() {
                          widget.level++;
                        });
                        model.pref!.setInt("level", widget.level);
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) {
                          return winpage(widget.level - 1);
                        },));
                      }
                    }
                    else {
                      Fluttertoast.showToast(
                          msg: "wrong answer",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM_LEFT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.brown,
                          fontSize: 17.0);
                    }
                  },
                  child: Container(
                    color: Colors.black,
                    alignment: Alignment.center,
                    height: toolbarheight,
                    width: 95,
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 26, fontFamily: f1, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: inputbutton(),
            ),
          ],
        ),
      ),
    );
  }

  String b1 = "";

  List<Widget> inputbutton() {
    List<Widget> list = [];

    for (int i = 0; i < 10; i++) {
      list.add(Expanded(
          child: InkWell(
              onTap: () {
                setState(() {
                  b1 = "$b1$i";
                });
              },
              child: Container(
                margin: EdgeInsets.all(2),
                color: Colors.black,
                height: 48,
                width: 35,
                child: Center(
                    child: Text(
                      "$i",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ))));
    }

    return list;
  }

  List<String> answer = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75"
  ];
}
