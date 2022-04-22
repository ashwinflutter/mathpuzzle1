import 'package:flutter/material.dart';
import 'package:mathpuzzle1/modelclaass.dart';
import 'package:mathpuzzle1/stage1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class selectlevel extends StatefulWidget {
  const selectlevel({Key? key}) : super(key: key);

  @override
  _selectlevelState createState() => _selectlevelState();
}

class _selectlevelState extends State<selectlevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: (63),
          backgroundColor: Colors.green.shade300,
          title: Text(
            "SELECT LEVEL",
            style: TextStyle(fontSize: 26, color: Colors.black54),
          ),
        ),
        backgroundColor: Colors.green.shade100,
        body: Container(
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: 75,
            itemBuilder: (context, index) {
              if (model.imglist[index] == "clear") {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return stage1(index);
                      },
                    ));
                  },
                  child: Container(
                    child: Text("${index + 1}"),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/tick.png"))),
                  ),
                );
              } else if (model.imglist[index] == "skip") {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return stage1(index);
                      },
                    ));
                  },
                  child: Container(
                   child: Text("${index+1}",style: TextStyle(fontSize: 20),),
                  ),
                );
              } else {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/lock.png"))),
                  ),
                );
              }
            },
          ),
        ));
  }
}
