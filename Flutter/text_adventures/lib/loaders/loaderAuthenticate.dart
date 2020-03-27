import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:text_adventures/widgets/loadingText.dart';

class LoaderAuthenticate extends StatefulWidget {
  @override
  _LoaderAuthenticateState createState() => _LoaderAuthenticateState();
}

class _LoaderAuthenticateState extends State<LoaderAuthenticate> {


  void changeScreen() async
  {
    // Temporary: Calling the authenticator here.
    await Future.delayed(Duration(seconds: 5),() {
        // NOTE: Pushes the home or the login screen. (Depends on authenticator) 
        Navigator.pushReplacementNamed(context, "login.dart");
      });
  }

  @override
  void initState(){
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SpinKitCubeGrid(
            color: Colors.white,
            size: 100.0,        
            )
          ),
          Center(
            child: SizedBox(height:40)
          ),
          Center(
            child: LoadingText()
          ),
      ],)
    );
  }
}