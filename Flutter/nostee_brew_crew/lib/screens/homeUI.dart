import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/services/authenticate.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Home",
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.w300,
          ),
          ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Authenticate().signOut();
            },
            child: Text(
              "Logout",
              style: TextStyle(
              letterSpacing: 2,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              ),
            )
          )
        ],
      ),
    );
  }
}