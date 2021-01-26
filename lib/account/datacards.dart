import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class DataCards extends StatelessWidget {
  final String data;
  final String title;
  final Widget icon;

  DataCards({@required this.data, @required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
            padding: EdgeInsets.only(left: 16, top: 8, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: Container(child: icon, width: 32)),
                Text(data,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                Text(title, style: TextStyle(fontSize: 15)),
              ],
            )));
  }
}
