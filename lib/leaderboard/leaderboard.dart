import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:typeracer/leaderboard/leaderboardcard.dart';
// custom
import 'profileitem.dart';
import 'leaderboardcard.dart';

class Leaderboard extends StatelessWidget {
  Leaderboard();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
      Column(children: [
        Expanded(
            flex: 4,
            child: Container(
              child: Row(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                      alignment: Alignment(0, .3),
                      child: Container(
                          padding: EdgeInsets.only(top: 80),
                          alignment: Alignment.center,
                          child: LeaderboardCard(place: "2", large: false))),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Align(
                      alignment: Alignment(0, .3),
                      child: Container(
                          padding: EdgeInsets.only(top: 40),
                          alignment: Alignment.center,
                          child: LeaderboardCard(place: "1", large: true))),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Align(
                      alignment: Alignment(0, .3),
                      child: Container(
                          padding: EdgeInsets.only(top: 80),
                          alignment: Alignment.center,
                          child: LeaderboardCard(place: "3", large: false))),
                ],
              ),
              // child: Row(children: <Widget>[]),
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
            )),
        Expanded(
            flex: 5,
            child: Container(
                child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            indicatorWeight: 4.0,
                            //indicatorSize: TabBarIndicatorSize.label,
                            tabs: <Widget>[
                              Tab(text: "Latest"),
                              Tab(text: "Overall")
                            ]),
                        Expanded(
                            child: SizedBox(
                                child: ListView.builder(
                          itemBuilder: (context, index) =>
                              ProfileItem(index: index + 1),
                          itemCount: 10,
                          shrinkWrap: true,
                        )))
                      ],
                    )))),
      ]),
      // Positioned(
      //   width: 70,
      //   height: 70,
      //   top: screenHeight * (4 / 9) - 300,
      //   // left: 16,
      //   // right: 16,
      //   child: Row(
      //     children: [LeaderboardCard()],
      //   ),
      // )
    ]);
  }
}
