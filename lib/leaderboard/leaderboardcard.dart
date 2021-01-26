import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class LeaderboardCard extends StatelessWidget {
  final String place;
  final bool large;

  LeaderboardCard({@required this.place, @required this.large});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
                width: large ? 100 : 70,
                height: large ? 100 : 70,
                child: ClipPolygon(
                    borderRadius: 2.0,
                    sides: 6,
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(3),
                        child: ClipPolygon(
                          sides: 6,
                          borderRadius: 4.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            backgroundImage:
                                AssetImage('assets/launch_image.png'),
                          ),
                        )))),
            Align(
                alignment: Alignment.center,
                child: Container(
                    width: large ? 30 : 25,
                    height: large ? 30 : 25,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Center(
                        child: Text(
                      place,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )),
                    // color: Colors.yellow,
                    padding: EdgeInsets.all(0))),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(3),
        ),
        Text("USERNAME", style: TextStyle(color: Colors.white, fontSize: 18)),
        Text("SCORE", style: TextStyle(color: Colors.white, fontSize: 15))
      ],
    ));
  }
}
