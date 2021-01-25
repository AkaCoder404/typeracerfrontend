// contains code for the default widget button click
import 'package:flutter/widgets.dart';

class ButtonClick extends StatelessWidget {
  final int clicked; 

  ButtonClick(this.clicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You have clicked the button this many times: ' ), 
          Text('$clicked', style: TextStyle(fontSize: 30)),
          Text(" times"),
        ],
      ), 
    );
  }
}