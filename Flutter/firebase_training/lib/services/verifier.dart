import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_training/models/user.dart';
import 'package:firebase_training/screens/home.dart';
import 'package:firebase_training/screens/login.dart';

class Verifier extends StatefulWidget {
  @override
  _VerifierState createState() => _VerifierState();
}

class _VerifierState extends State<Verifier> {
  @override
  Widget build(BuildContext context) {
    final dynamic user = Provider.of<User>(context); 
    return user != null ? Home() : Login();
  }
}