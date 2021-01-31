import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:typeracer/quotes/quote.dart';

class QuoteDisplay extends StatefulWidget {
  final Text quote;

  QuoteDisplay({@required this.quote});

  @override // _ makes class private
  _QuoteDisplayText createState() => _QuoteDisplayText();
}

class _QuoteDisplayText extends State<QuoteDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          child: widget.quote,
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
