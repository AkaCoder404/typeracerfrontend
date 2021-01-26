import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final int index;
  ProfileItem({
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '$index',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: CircleAvatar(
                  backgroundImage: AssetImage('assets/launch_image.png'),
                  radius: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Username"), Text("Score")],
            ),
          ],
        ));
  }
}
