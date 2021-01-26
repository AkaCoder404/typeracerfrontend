import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

// user defined
import './quote.dart';
import './loadquote.dart';

// account
import './account/account.dart';
// home
import './home/home.dart';
// leaderboard
import './leaderboard/leaderboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Type Racer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Type Racer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override // _ makes class private
  _MyHomePageState createState() =>
      _MyHomePageState(); //return _MyHomePageState()
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  Quote quote;

  // all tab widgets
  final tabs = [
    Home(),
    Leaderboard(),
    Account("username", "score"),
  ];

  void _loadQuote() async {
    // set up POST request arguments
    String url = "https://typeracerbackend-1.herokuapp.com/api/getquote/";
    Map<String, String> headers = {"Content-type": "application/json"};
    String request = '{ "message" : "getquote" }';

    // make POST request
    Response response = await post(url, headers: headers, body: request);
    var body = json.decode(response.body);
    print(body);
    // print(response.body);

    // setState
    setState(() {
      quote = Quote(body['text'], body['source_type'], body['source_title'],
          body['source_link']);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title: Text(widget.title),
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
      // body: /*true ?*/ Center(
      //   child: Column(
      //     // mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       quote,
      //     ],
      //   ),
      // ) /*: Center()*/,
      // floatingActionButton: LoadQuote(_loadQuote),
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
