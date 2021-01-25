import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddQuote extends StatelessWidget {
  final Function selectHandler;

  AddQuote(this.selectHandler);

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