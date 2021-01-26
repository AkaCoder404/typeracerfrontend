import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// customs
import '../navigation/narrowappbar.dart';

class PersonalRecordPage extends StatelessWidget {
  PersonalRecordPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NarrowAppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back)),
            trailing: Container(
              child: Text("USERNAME",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 5)),
            )),
        body: Column(children: <Widget>[
          Text("personal records page"),
        ]));
  }
}
