import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool toggle = true;
  
  void login()
  {
    if(formKey.currentState.validate())
    {
      Navigator.pushReplacementNamed(context, "loaderLogin.dart", arguments: {
      "email": email,
      "password": password,
      });
    }
    else
    {
      print("Login failed."); // debug
    }
  }

  Widget loginForm()
  {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,0),
              child: TextFormField(
                validator: (val) {
                  if(val=="")
                  {
                    return "Empty email.";
                  }
                  else
                  {
                    email = val;
                    return null;
                  }
                },
                decoration: InputDecoration(
                  filled : true,
                  fillColor: Colors.white70,
                  hintText: "Email",
                ),
                style: TextStyle(
                  fontSize: 25
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                    validator: (val) {
                      if(val=="")
                      {
                        return "Empty password.";
                      }
                      else
                      {
                        password = val;
                        return null;
                      }
                    },
                    obscureText: toggle,
                    decoration: InputDecoration( 
                      filled : true,
                      fillColor: Colors.white70,
                      hintText: "Password",
                    ),
                    style: TextStyle(
                      fontSize: 25
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if(toggle==true)
                    {
                      toggle=false;
                    }
                    else{
                      toggle=true;
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.remove_red_eye),
                  color: Colors.white70,
                )
                ],
              )
            ),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.black,
                onPressed: () {
                  login();
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35
                  ),
                  )
                ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "register.dart");
                },
                child: Text(
                  "Don't have an account? Click me.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                  )
                )
            ],
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: <Widget>[
                Text(
                  "Build no. 27032020\nVersion 0.01 - Alpha Test",
                  style: TextStyle(
                    color: Colors.white60
                  ),
                  ),
                SizedBox(height: 70),
                Center(
                  child: Text(
                    "TEXT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 135
                    ),
                    ),
                ),
                Center(
                  child: Text(
                    "ADVENTURES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50
                    ),
                    ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "A DND SPIN-OFF RPG GAME",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      letterSpacing: 2,
                    ),
                    ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/campfire.gif",
                    ),
                  ],
                ),
                SizedBox(height: 70),
                loginForm()
            ],
          ),
        ),
      )
    );
  }
}
