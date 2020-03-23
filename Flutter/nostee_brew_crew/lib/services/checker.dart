import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/models/user.dart';
import 'package:nostee_brew_crew/screens/homeUI.dart';
import 'package:nostee_brew_crew/screens/loginUI.dart';
import 'package:provider/provider.dart';


// this is a class that checks if the user is authenticated or not
class Checker extends StatefulWidget {
  @override
  _CheckerState createState() => _CheckerState();
}

class _CheckerState extends State<Checker> {

  @override
  Widget build(BuildContext context) {
    //returns a screen: homeUI or loginUI
    final dynamic currentUser = Provider.of<User>(context);
    if(currentUser==null)
    {
     return LoginUI();
    }
    else
    {
      return HomeUI();
    }
  }
}


