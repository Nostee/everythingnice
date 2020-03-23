import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nostee_brew_crew/services/authenticate.dart';

class LoadingUser extends StatefulWidget {
  @override
  _LoadingUserState createState() => _LoadingUserState();
}

class _LoadingUserState extends State<LoadingUser> {

  @override
  void initState() { 
    super.initState();
    delayedRun();
  }

  Future<void> delayedRun() async
  {
    dynamic currentUser = await Authenticate().signInAnon();
    Navigator.pop(context, {"data": currentUser});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRipple(
          color: Colors.brown,
          size: 200.0,
        ),
      )
    );
  }
}