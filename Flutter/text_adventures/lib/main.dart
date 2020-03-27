import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_adventures/loaders/loaderAuthenticate.dart';
import 'package:text_adventures/screens/home.dart';
import 'package:text_adventures/screens/login.dart'; 

void main() => runApp(Starter());

class Starter extends StatefulWidget {
  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([]);
    return MaterialApp(
      // NOTE: THIS IS THE THEME
      theme: ThemeData(
        primaryColor: Colors.black,
	      accentColor: Colors.black87,
        cursorColor: Colors.black87,
        fontFamily: "Pixelated"
      ),


      // NOTE: HERE ARE THE SCREENS
      routes: {
        "/": (context) => LoaderAuthenticate(), 
        "login.dart": (context) => Login(),
        "home.dart": (context) => Home(),
      }
      );
  }
}
