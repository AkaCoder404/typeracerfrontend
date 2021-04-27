import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

// customs
import 'gamemodecard.dart';
import '../gamemodes/practice.dart';

class Home extends StatelessWidget {
  Home();

  @override
  Widget build(BuildContext context) {
    void showToast(String msg, {int duration, int gravity}) {
      Toast.show(msg, context, duration: duration, gravity: gravity);
    }

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
                Text(" the global typing competition for mobile",
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
            GestureDetector(
                child: GameModeCard(
                  buttonDescription: "enter typing race",
                  description: "get matched up with online opponents",
                  backgroundImage: "assets/racing.png",
                ),
                onTap: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => Practice()));
                  // Navigator.of(context).push(null);
                  showToast("has not been developed yet",
                      gravity: Toast.BOTTOM);
                }),
            GestureDetector(
                child: GameModeCard(
                  buttonDescription: "practice yourself",
                  description: "improve typing skills on your own",
                  backgroundImage: "assets/practice.png",
                ),
                onTap: () {
                  Navigator.of(context).push(_createRoute());
                }),
            GestureDetector(
              child: GameModeCard(
                buttonDescription: "race your friends",
                description: "invite people to a private race with chat",
                backgroundImage: "assets/friends.png",
              ),
              onTap: () {
                showToast("has not been developed yet", gravity: Toast.BOTTOM);
              },
            )
          ],
        ));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PracticePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1, 0); // from left, (0,0) from bottom
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
