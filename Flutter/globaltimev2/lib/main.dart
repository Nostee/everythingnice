import 'package:flutter/material.dart';
import 'package:globaltimev2/pages/home.dart';
import 'package:globaltimev2/pages/chooser.dart';

void main() => runApp(MaterialApp(
  routes: {
    "/" : (context) => Home(),
    "/chooser" : (context) => Chooser()
  },
));
