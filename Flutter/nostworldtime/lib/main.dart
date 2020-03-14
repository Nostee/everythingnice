import 'package:flutter/material.dart';
import "package:nostworldtime/pages/home.dart";
import "package:nostworldtime/pages/choose_location.dart";
import "package:nostworldtime/pages/loading_screen.dart";

void main() => runApp(MaterialApp(
  routes: {
    "/": (context) => LoadingScreen(),
    "/home": (context) => Home(),
    "/chooseLocation": (context) => ChooseLocation(),
  },
  initialRoute: "/home",
));

