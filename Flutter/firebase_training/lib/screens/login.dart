import 'package:flutter/material.dart';
import 'package:firebase_training/services/authenticator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email;
  String password;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: ListView(
              children: <Widget>[
                TextFormField(
                  onChanged: (val) {
                    email = val;
                  }
                ),
                SizedBox(height: 30),
                TextFormField(
                  onChanged: (val) {
                    password = val;
                  }
                ),
                SizedBox(height: 30),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    Authenticator().login(email,password);
                  },
                ),
                SizedBox(height: 10),
                RaisedButton(
                  child: Text("Instant Login"),
                  onPressed: () {
                    Authenticator().login("nosteeeeeee@gmail.com","Jedidiah1");
                  },
                ),
              ],
          ),
        ),
      )
    );
  }
}