import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Quote extends StatelessWidget {
  final String text;
  final String sourceType;
  final String sourceTitle;
  final String sourceLink;

  Quote(this.text, this.sourceType, this.sourceTitle, this.sourceLink);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 2,
          child: Column(
            // width: double.infinity,
            crossAxisAlignment:
                CrossAxisAlignment.start, // allow for left align text
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.book, size: 50),
                title: Text(sourceTitle),
                subtitle: Text(sourceType),
                // tileColor: Colors.blue,
              ),
              // const Divider(
              //   color: Colors.black,
              //   thickness: 1,
              // ),
              Container(
                // margin: EdgeInsets.all(.1),
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Text(text,
                    style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
              )
            ],
          ),
        ));
  }
}
