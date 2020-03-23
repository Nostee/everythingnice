import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nostee_brew_crew/services/authenticate.dart';

class LoadingRegister extends StatefulWidget {
  @override
  _LoadingRegisterState createState() => _LoadingRegisterState();
}

class _LoadingRegisterState extends State<LoadingRegister> {

  Map data;

  @override
  void initState() { 
    super.initState();
  }

  Future<void> delayedRun(String email,String password) async
  {
    try
    {
      dynamic data = await Authenticate().register(email,password);
      if(data!="Failed!")
      {
        print("Current User: ${data.uid}");
      }
      Navigator.pop(context, {
        "data": data,
      });
    }
    catch(e){
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