import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:typeracer/scores/personalrecord.dart';

import 'myinfo.dart';
import 'datacards.dart';
import 'datacardssmall.dart';

class Account extends StatelessWidget {
  final String username;
  final String score;

  Account(this.username, this.score);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        const Color(0xFF3366FF),
                        const Color(0xFF00CCFF),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "My Profile",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              // letterSpacing: 1.1
                            ),
                            //style:
                          ),
                        ),
                        MyInfo()
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                    padding: EdgeInsets.only(top: 25),
                    color: Colors.white,
                    child: Table(children: [
                      TableRow(children: [
                        GestureDetector(
                            child: DataCards(
                                data: "95",
                                title: "wpm last 10 races",
                                icon: Icon(Icons.save, color: Colors.blue)),
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => PersonalRecordPage()));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PersonalRecordPage()));
                            }),
                        DataCards(
                            data: "100",
                            title: "best wpm",
                            icon: Icon(Icons.save, color: Colors.blue))
                      ]),
                      TableRow(children: [
                        DataCards(
                            data: "300",
                            title: "completed races",
                            icon: Icon(Icons.save, color: Colors.blue)),
                        DataCards(
                            data: "80",
                            title: "won races",
                            icon: Icon(Icons.save, color: Colors.blue))
                      ]),
                      TableRow(children: [
                        DataCards(
                            data: "95",
                            title: "percentile",
                            icon: Icon(Icons.save, color: Colors.blue)),
                        DataCards(
                            data: "5000",
                            title: "points",
                            icon: Icon(Icons.save, color: Colors.blue))
                      ]),
                    ])),
              ),
            ],
          ),
          Positioned(
              top: screenHeight * (4 / 9) - 95,
              left: 16,
              right: 16,
              child: Container(
                height: 60,
                child: Row(
                  children: <Widget>[
                    DataCardsSmall(
                        data: "81",
                        title: "overall wpm",
                        hasImage: false,
                        icon: Icon(Icons.graphic_eq)),
                    DataCardsSmall(
                        data: "",
                        title: "",
                        hasImage: true,
                        icon: Icon(
                          Icons.graphic_eq,
                          color: Colors.blue,
                        )),
                    DataCardsSmall(
                        data: "8",
                        title: "level",
                        hasImage: false,
                        icon: Icon(Icons.graphic_eq)),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
