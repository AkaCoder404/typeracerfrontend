import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:typeracer/home/home.dart';
import 'dart:async';
import 'dart:convert';

// custom
import '../mainlayout.dart';

class Login extends StatelessWidget {
  String username;
  String password;
  Login();

  void _loginWithFacebookRequest() {
    print("login");
  }

  @override
  Widget build(BuildContext context) {
    void _loginRequest() async {
      String url = "https://typeracerbackend-1.herokuapp.com/api/login/";
      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, String> request = {
        "username": username,
        "password": password
      };
      String jsonRequest = json.encode(request);
      Response response = await post(url, headers: headers, body: jsonRequest);
      var body = json.decode(response.body);
      print(body);

      if (body['message'].compareTo('login successful') == 0) {
        Navigator.of(context).push(_createRoute());
        //   Navigator.pushNamedAndRemoveUntil(
        //       context, _createRoute(), (_) => false);
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Container(
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        const Color(0xFF3366FF),
                        const Color(0xFF00CCFF)
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1, 1),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                height: size.height,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                  child: Image.asset("assets/launch_image.png",
                                      scale: .8)),
                              Container(
                                // alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                                child: Text("Type Racer",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ])),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 20,
                    ),
                    Container(),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      // padding: EdgeInsets.symmetric(horizontal: 50),
                      child: RoundedInputField(
                          hintText: "username",
                          onChanged: (value) {
                            username = value;
                          }),
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: double.infinity,
                        child: PasswordInputField(
                          onChanged: (value) {
                            password = value;
                          },
                        )),
                    SizedBox(height: 10),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: RoundedButton(
                          text: "login",
                          press: () {
                            _loginRequest();
                          },
                        )),
                  ],
                ))));
  }
}

// rounded button
class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

// username input
class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Widget child;

  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
            autofocus: false,
            onChanged: onChanged,
            decoration: InputDecoration(
              icon: Icon(icon, color: Colors.blue),
              hintText: hintText,
              border: InputBorder.none,
              focusedBorder: null,
            )));
  }
}

// password text field
class PasswordInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final IconData suffixIcon;
  final ValueChanged<String> onChanged;
  final Widget child;

  const PasswordInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.lock,
      this.suffixIcon = Icons.visibility,
      this.onChanged,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        autocorrect: false,
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "password",
            suffixIcon: Icon(suffixIcon, color: Colors.blue),
            icon: Icon(icon, color: Colors.blue),
            border: InputBorder.none),
      ),
    );
  }
}

// container for text fields
class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: child,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29), color: Colors.white),
    );
  }
}

// navigation
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MainLayout(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1, 0); // from left, (0,0) from bottom
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
