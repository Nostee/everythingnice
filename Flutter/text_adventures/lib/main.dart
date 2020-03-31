import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_adventures/loaders/loaderAuthenticate.dart';
import 'package:text_adventures/loaders/loaderLogin.dart';
import 'package:text_adventures/loaders/loaderRegister.dart';
import 'package:text_adventures/screens/home.dart';
import 'package:text_adventures/screens/login.dart';
import 'package:text_adventures/screens/register.dart'; 
import 'package:text_adventures/services/authenticator.dart';
import 'package:provider/provider.dart';
import 'package:text_adventures/models/user.dart';

void main() => runApp(Starter());

class Starter extends StatefulWidget {
  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([]);
    return StreamProvider<UserLogin>.value(
        value: Authenticator().user,
        child: MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
	      accentColor: Colors.black87,
        cursorColor: Colors.black87,
        fontFamily: "Pixelated"
      ),
      routes: {
        "/": (context) => LoaderAuthenticate(), 
        "login.dart": (context) => Login(),
        "home.dart": (context) => Home(),
        "register.dart": (context) => Register(),
        "loaderRegister.dart": (context) => LoaderRegister(),
        "loaderLogin.dart": (context) => LoaderLogin(),
      }
      )
    );
  }
}
