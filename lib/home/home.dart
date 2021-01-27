import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// customs
import 'gamemodecard.dart';

class Home extends StatelessWidget {
  Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Container(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Text("Type Racer for mobile",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
                Text("- the global typing competition for mobile",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold)),
                Text("select a game mode below",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold))
              ])),
        ),
        body: Column(
          children: [
            GameModeCard(
              buttonDescription: "enter typing race",
              description: "get matched up with online opponents",
              backgroundImage: "assets/racing.png",
            ),
            GameModeCard(
              buttonDescription: "practice yourself",
              description: "improve typing skills on your own",
              backgroundImage: "assets/practice.png",
            ),
            GameModeCard(
              buttonDescription: "race your friends",
              description: "invite people to a private race with chat",
              backgroundImage: "assets/friends.png",
            )
          ],
        ));
  }
}
