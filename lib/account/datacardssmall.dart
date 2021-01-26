import 'package:flutter/material.dart';

class DataCardsSmall extends StatelessWidget {
  final String data;
  final String title;
  final bool hasImage;
  final Widget icon;

  DataCardsSmall(
      {@required this.data,
      @required this.title,
      @required this.hasImage,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: hasImage
              ? Center(
                  child: Container(width: 20, child: icon),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(data), Text(title)],
                )),
    );
  }
}
