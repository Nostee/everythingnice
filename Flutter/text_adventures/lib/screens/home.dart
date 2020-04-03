import 'package:flutter/material.dart';
import 'package:text_adventures/services/authenticator.dart';
import 'package:text_adventures/widgets/setupCharacter.dart';

// this is the home interface

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // temporary
  bool toggle = true;

  void signOut()
  {
    dynamic check = Authenticator().signOut();
    print("(home.dart)The data in the dynamic check is: $check"); // debug
    if(check!=null)
    {
      Navigator.pushReplacementNamed(context, "login.dart");
    }
    else{
      print("(home.dart)Logout failed."); // debug
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return toggle == true ? Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(
          "HOME CAMP",
          style: TextStyle(
            letterSpacing: 6
          )
          ),
        actions: <Widget>[
          FlatButton(onPressed: (){signOut();}, 
          child: Text(
            "SIGN OUT",
            style: TextStyle(
              color: Colors.white
              )
            )
            )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/campfirebg.gif"),
            fit: BoxFit.cover
          )
        ),
      )
    ) : SetupCharacter();
  }
}