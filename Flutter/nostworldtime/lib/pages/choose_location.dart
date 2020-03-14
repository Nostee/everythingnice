import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void delayedRun() async
  {
    String username = await Future.delayed(Duration(seconds: 3),() {
      return "Nostee";
    });

    print("Username is $username.");

    String password = await Future.delayed(Duration(seconds: 3),() {
      return "Jedidiah1";
    });

    print("Password is $password.");
  }
  
  @override
  void initState() {
    super.initState();
    print("Getting data..");
    delayedRun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
            "Choose a location:",
          style: TextStyle(
            letterSpacing: 4,
          ),
        )
      ),
    );
  }
}
