import 'package:flutter/material.dart';
import 'package:text_adventures/services/authenticator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void signOut()
  {
    dynamic check = Authenticator().signOut();
    print("The data in the dynamic check is: $check"); // debug
    if(check!=null)
    {
      Navigator.pushReplacementNamed(context, "login.dart");
    }
    else{
      print("Logout failed."); // debug
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // temporary
      appBar: AppBar(
        title: Text("This is the homescreen."),
        actions: <Widget>[
          FlatButton(onPressed: (){signOut();}, 
          child: Text(
            "Sign out",
            style: TextStyle(
              color: Colors.white
              )
            )
            )
        ],
      ),
    );
  }
}