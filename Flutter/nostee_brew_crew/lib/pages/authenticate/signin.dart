import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  // this is the datas used by this class
  dynamic data;
  String userid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 85,
                  backgroundImage: AssetImage("assets/coffee_beans.jpg"),
                ),
                SizedBox(height: 100),
                // this is for email sign-in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                    onPressed: () async {},
                    child: Text(
                      "EMAIL SIGN-IN",
                      style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )
                      )
                    ),
                  ],
                ),
                // this is for anonymous sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                    onPressed: () async {
                      data = await Auth().signInAnon();
                      print("Signed in!");
                      print("User ID: ${data.uid}");
                    },
                    child: Text(
                      "ANONYMOUS USER",
                      style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )
                      )
                    ),
                  ],
                ),
              ],
            ),
      )
    );
  }
}