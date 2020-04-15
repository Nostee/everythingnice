import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_training/models/user.dart';
import 'package:firebase_training/services/authenticator.dart';
import 'package:firebase_training/services/verifier.dart';
import 'package:firebase_training/screens/home.dart';
import 'package:firebase_training/screens/login.dart';

void main() => runApp(FirebaseTraining());

class FirebaseTraining extends StatefulWidget {
  @override
  _FirebaseTrainingState createState() => _FirebaseTrainingState();
}

class _FirebaseTrainingState extends State<FirebaseTraining> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: Authenticator().user,
        child: MaterialApp(
          routes:
          {
            "/": (context) => Verifier(),
            "/home.dart": (context) => Home(),
            "/login.dart": (context) => Login()
          }
      ),
    );
  }
}