import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';

class GameModeCard extends StatelessWidget {
  final String description;
  final String buttonDescription;
  final String backgroundImage;
  GameModeCard(
      {@required this.description,
      @required this.buttonDescription,
      @required this.backgroundImage});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 400,
        child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            semanticContainer: true,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset(backgroundImage, height: 100, width: 400
                      // width: ,
                      ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(description),
                    // decoration: ,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: ElevatedButton(
                  //       child: Text(buttonDescription),
                  //       onPressed: null,
                  //     ))
                ],
              ),
            )));
  }
}
