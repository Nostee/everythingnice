import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/loaders/loadingLogin.dart';
import 'package:nostee_brew_crew/loaders/loadingRegister.dart';
import 'package:nostee_brew_crew/screens/homeUI.dart';
import 'package:nostee_brew_crew/loaders/loadingUser.dart';
import 'package:nostee_brew_crew/screens/loginUI.dart';
import 'package:nostee_brew_crew/screens/registerUI.dart';
import 'package:nostee_brew_crew/services/authenticate.dart';
import 'package:nostee_brew_crew/services/checker.dart';
import 'package:provider/provider.dart';
import 'package:nostee_brew_crew/models/user.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authenticate().user,
          child: MaterialApp(
            theme: ThemeData(
              primaryColor: Colors.blueGrey,
              accentColor: Colors.blueGrey,
              cursorColor: Colors.blueGrey
            ),
            routes: {
              "/" : (context) => Checker(), //service
              "/HomeUI" : (context) => HomeUI(), //screen
              "/LoginUI" : (context) => LoginUI(), //screen
              "/RegisterUI" : (context) => RegisterUI(), //screen
              "/LoadingUser" : (context) => LoadingUser(), //loader
              "/LoadingRegister" : (context) => LoadingRegister(), //loader
              "/LoadingLogin" : (context) => LoadingLogin(), //loader
            },
      ),
    );
  }
}