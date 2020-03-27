import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: <Widget>[
                SizedBox(height: 70),
                Center(
                  child: Text(
                    "TEXT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 135
                    ),
                    ),
                ),
                Center(
                  child: Text(
                    "ADVENTURES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50
                    ),
                    ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/campfire.gif",
                    ),
                  ],
                ),
            ],
          ),
        ),



        
      )
    );
  }
}