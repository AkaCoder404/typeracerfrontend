import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// custom
import './account/account.dart';
import './home/home.dart';
import './leaderboard/leaderboard.dart';

// main layout of app after login/signup screen
class MainLayout extends StatefulWidget {
  MainLayout({Key key}) : super(key: key);

  @override
  _MainLayoutPageState createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayout> {
  int _currentIndex = 0;
  // tabs
  final tabs = [
    Home(),
    Leaderboard(),
    Account("", ""),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title: Text("Type Racer"),
        toolbarHeight: 66.0,
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard), label: "Leaderboard"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Account")
          ],
          onTap: (index) {
            // print(index);
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
