import 'package:flutter/material.dart';
import 'package:globaltime/pages/home.dart';
import 'package:globaltime/pages/chooser.dart';

void main() => runApp(MaterialApp(
  routes: {
    "/": (context) => Home(),
    "/chooser": (context) => Chooser(),
  }
));

