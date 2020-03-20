import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/models/user.dart';
import 'package:nostee_brew_crew/services/auth.dart';
import 'package:nostee_brew_crew/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(Starter());

class Starter extends StatefulWidget {
  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
    value: Auth().id,
      child: MaterialApp(
      routes: {
        "/" : (context) => Wrapper(),
      }
      )
    );
  }
}