import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; 
import 'package:http/http.dart'as http;

// click button to load quote
class LoadQuote extends StatelessWidget {
  final Function selectHandler;

  LoadQuote(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        tooltip: 'Load Quote',
        onPressed: selectHandler,
        child: Icon(Icons.add)
      ),
    );
  }
}