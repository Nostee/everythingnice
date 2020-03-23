import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nostee_brew_crew/services/authenticate.dart';

class LoadingLogin extends StatefulWidget {
  @override
  _LoadingLoginState createState() => _LoadingLoginState();
}

class _LoadingLoginState extends State<LoadingLogin> {

  Map data;
  Future<void> delayedRun(String email,String password) async
  {
    try
    {
      dynamic data = await Authenticate().login(email, password);
      Navigator.pop(context ,{
        "data" : data
      });
    }
    catch(e)
    {

    }
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    delayedRun(data["email"],data["password"]);
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