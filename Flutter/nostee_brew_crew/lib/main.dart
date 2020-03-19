import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/pages/wrapper.dart';
import 'package:nostee_brew_crew/pages/authenticate.dart';
import 'package:nostee_brew_crew/pages/home.dart';

void main() => runApp(MaterialApp(
  routes: {
    "/" : (context) => Wrapper(),
    "/authenticate" : (context) => Authenticate(),
    "/home" : (context) => Home(),

  }
));

