import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/models/flavors.dart';
import 'package:nostee_brew_crew/services/authenticate.dart';
import 'package:nostee_brew_crew/services/database.dart';
import 'package:nostee_brew_crew/widgets/displayBrews.dart';
import 'package:provider/provider.dart';
import 'package:nostee_brew_crew/widgets/showSettings.dart';



class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    // THIS IS THE BOTTOM SHEET
    void showSettings()
    {
      showModalBottomSheet(context: context, builder: (context) {
        return ShowSettings();
      });
    }

    // THIS IS THE UI
    return StreamProvider<List<Flavors>>.value(
          value: Database(uid: "ALL").info,
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5,20,20,20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 40),
                   Text("Note: The color represents the strength."),
                ],
              ),
             SizedBox(height: 10),
             Expanded(child: DisplayBrews())
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showSettings();
          },
          backgroundColor: Colors.brown,
          elevation: 0,
          child: Text(
            "Order",
            style: TextStyle(
              fontWeight: FontWeight.w300
            )
            ),
        ),
      ),
    );
  }
}