import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:countdown_flutter/countdown_flutter.dart';

import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

// custom
import '../navigation/narrowappbar.dart';
import '../quotes/quote.dart';
import '../quotes/quotedisplay.dart';

class Practice extends State<PracticePage> {
  Quote quoteData =
      Quote("loading...", "loading...", "loading...", "loading...");
  QuoteDisplay quoteDisplay =
      QuoteDisplay(quote: Text("loading", style: TextStyle(fontSize: 15)));
  bool raceEnded = false;
  bool raceStarted = false;
  Text raceStartText = Text("race is about to start",
      style: TextStyle(color: Colors.purple[900]));
  Text raceEndText = Text("race has ended");

  Timer timer;
  Duration timerInterval = Duration(seconds: 1);

  int wpm = 0;
  int time = 0;
  int words;
  int quoteText;
  double progress = 0;
  String quoteProgress = "";

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

    // if (this.mounted) {
    //   setState(() {
    //     words = body['text'].split(' ').length;
    //     quoteData = Quote(body['text'], body['source_type'],
    //         body['source_title'], body['source_link']);
    //     quoteDisplay = QuoteDisplay(
    //       quote: body['text'],
    //     );
    //   });
    // }

    // print(body['text'].split(' ').length);

    // setState
    setState(() {
      raceStarted = false;
      raceEnded = false;
      progress = 0;
      // quoteProgress = body['text'];
      time = 0;
      words = body['text'].split(' ').length;
      quoteData = Quote(body['text'], body['source_type'], body['source_title'],
          body['source_link']);
      quoteDisplay = QuoteDisplay(
        quote: Text(body['text'], style: TextStyle(fontSize: 15)),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (timer != null) timer.cancel();
    super.dispose();
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {_loadQuote()});
  }

  void restart() {
    setState(() {
      time = 0;
      wpm = 0;
      progress = 0;
      raceStarted = false;
      raceEnded = false;
      quoteDisplay = QuoteDisplay(
          quote: Text(quoteData.text, style: TextStyle(fontSize: 15)));
    });
    print("restart");
  }

  void textChange(text) {
    // print(quoteData.text);
    // if typed word is correct, display highlight
    if (quoteData.text.contains(text)) {
      if (progress < text.length / quoteData.text.length) {
        setState(() {
          progress = text.length / quoteData.text.length;
          quoteDisplay = QuoteDisplay(
              quote: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: text,
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: quoteData.text
                        .substring(text.length, quoteData.text.length))
              ],
            ),
          ));
        });
      }
    }

    // print(text);
    if (text.compareTo(quoteData.text) == 0) {
      print("true");
      print(time);
      print(words);
      print("wpm ${(words / time * 60)}");
      timer.cancel();
      setState(() {
        wpm = (words / time * 60).round();
        raceEnded = !raceEnded;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NarrowAppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back)),
            trailing: Container(
                child: Text("PRACTICE",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 5)))),
        body: Column(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Text("Practice Racetrack", style: TextStyle(fontSize: 24)),
                    Text("you are in a single-player race",
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      raceStarted
                          ? raceEnded
                              ? raceEndText
                              : Text("go!")
                          : raceStartText,
                      Align(
                        alignment: Alignment.centerRight,
                        child: !raceStarted
                            //? // Container()

                            ? Countdown(
                                duration: Duration(seconds: 5),
                                onFinish: () {
                                  setState(() {
                                    raceStarted = !raceStarted;
                                    timer =
                                        Timer.periodic(timerInterval, (timer) {
                                      setState(() {
                                        time = time + 1;
                                        // print(time);
                                      });
                                      // print('afterTimer=' +
                                      //     DateTime.now().toString());
                                    });
                                  });

                                  print('finished!');
                                },
                                builder:
                                    (BuildContext ctx, Duration remaining) {
                                  return Text(

                                      /*${remaining.inMinutes}:*/ '${remaining.inSeconds}');
                                },
                              )
                            : Text('$wpm wpm'),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Container(
                height: 20,
                child: LinearProgressIndicator(value: progress),
                margin: EdgeInsets.symmetric(horizontal: 15),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    child: quoteDisplay,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                  )
                  // color: Colors.blue,
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  // padding: EdgeInsets.all(0),
                  ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              raceEnded
                  ? Container()
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        onChanged: (text) {
                          textChange(text);
                        },
                        enabled: raceStarted,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: 'start typing the text above',
                          filled: true,
                          fillColor: Color(0xFFDBEDFF),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
              raceEnded
                  ? Container(
                      // color: Colors.black,
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // GestureDetector(
                        Container(
                          // alignment: Alignment.center,
                          child: Card(
                            elevation: 5,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.orange[600]),
                                child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: Text("Retry Race",
                                        style: TextStyle(color: Colors.white))),
                                onPressed: restart),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                        ),
                        Container(
                            // alignment: Alignment.center,
                            child: Card(
                          elevation: 5,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[600]),
                            child: Container(
                                padding: EdgeInsets.all(15),
                                child: Text("New Race",
                                    style: TextStyle(color: Colors.white))),
                            onPressed: _loadQuote,
                          ),
                        ))
                      ],
                    ))
                  : Container(),
            ]));
  }
}

class PracticePage extends StatefulWidget {
  PracticePage({Key key}) : super(key: key);

  @override
  Practice createState() => Practice();
}
