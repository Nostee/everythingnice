import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/models/flavors.dart';
import 'package:nostee_brew_crew/services/authenticate.dart';
import 'package:nostee_brew_crew/services/database.dart';
import 'package:nostee_brew_crew/widgets/displayBrews.dart';
import 'package:provider/provider.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Flavors>>.value(
          value: Database().info,
          child: Scaffold(
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
        body: DisplayBrews()
      ),
    );
  }
}