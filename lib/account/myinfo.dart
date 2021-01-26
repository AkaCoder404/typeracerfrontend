import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// commons
import 'package:typeracer/commons/radial_progress.dart';

class MyInfo extends StatelessWidget {
  final size = Size.fromWidth(120);
  MyInfo();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        RadialProgress(
          width: 4,
          goalCompleted: 1.0,
          child: ClipOval(
            child: Image.asset(
              "assets/launch_image.png",
              width: size.width / 1.2,
              height: size.width / 1.2,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Username",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 5),
        Text(
          "Location",
          style: TextStyle(color: Colors.white, fontSize: 15),
          // icon: Icons.flag ,
        ),
      ]),
    );
  }
}
