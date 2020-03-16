import 'package:flutter/material.dart';
import "package:nostworldtime/services/worldTime.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void setUp() async
  {
    await Future.delayed(Duration(seconds: 2),() {print("Setting up for 2 seconds..");});
    WorldTime wt = WorldTime(location: "Manila", country: "Asia/Manila");
    await wt.getTime();
    print(wt.currentTime);
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": wt.location,
      "currentTime": wt.currentTime,
      "dayTime": wt.dayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitWanderingCubes(
            color: Colors.black,
            size: 50.0,
            ),
            SizedBox(height: 50),
            Text(
                "Loading",
              style: TextStyle(
                letterSpacing: 5
              ),
            )
          ],
        ),
      )
    );
  }
}
