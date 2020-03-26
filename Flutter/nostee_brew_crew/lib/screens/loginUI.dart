import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/shared/constants.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {

  String email;
  String password;
  String errorMessage = "";
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // this is the list view
        child: ListView(
          children: <Widget>[
            // this is first row (LOG IN FORM)
            Padding(
              padding: const EdgeInsets.fromLTRB(30,170,30,0),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.black87,
                              backgroundImage: AssetImage("assets/coffee_beans.jpg"),
                              radius: 60
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                "COFFEE?",
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w100,
                                  letterSpacing: 5,
                                  ),
                                ),
                                Text(
                                "COFFEE.",
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 5,
                                  
                                  ),
                                ),
                                Text(
                                "Grab your coffee now.",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ],
                            ),

                        ],
                      ),
                      SizedBox(height: 55),
                      // NOTE: Error Message
                      Text(
                        errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      // NOTE: Email
                      TextFormField(
                        validator: (value) {
                          return value.length == 0 ? "Enter a valid email." : null;
                        },
                        decoration: myInputDecoration.copyWith(labelText: "Email"),
                        onChanged: (value) {
                          setState((){
                            email = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      SizedBox(height: 30),
                      // NOTE: Password
                      TextFormField(
                        validator: (value) {
                          return value.length<6 ? "Enter a valid 6+ character password." : null;
                        },
                        decoration: myInputDecoration.copyWith(labelText: "Password"),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 30),
                      // NOTE: Log-in Button
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () async{
                            if(formKey.currentState.validate())
                            {
                              dynamic data = await Navigator.pushNamed((context),"/LoadingLogin",arguments: 
                              {
                                "email" : email,
                                "password" : password
                              } );
                              print("the data right now is $data");
                              if(data["data"]=="Failed!")
                              {
                                errorMessage = "WRONG EMAIL OR PASSWORD.";
                                setState(() {
                                  
                                });
                              }
                            }
                          }, 
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w300,
                            ),
                            ),
                        ),
                      ],
                    ),
                    ],
                  )
              ),
            ),
            // this is second row (ANONYMOUS)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () async {  
                    dynamic fetchedData = await Navigator.pushNamed(context, "/LoadingUser");
                    print("Currently signed in: ${fetchedData["data"]}");
                  }, 
                  child: Text(
                    "Anonymous User? Click me.",
                    style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w300,
                    ),
                  )
                ),
                SizedBox(width: 25),
              ],
              
            ),
            // this is third row (REGISTER)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () async {  
                    print("Switching to register forms...");
                    Navigator.pushNamed(context, "/RegisterUI");
                  }, 
                  child: Text(
                    "Create a new account.",
                    style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w300,
                    ),
                  )
                ),
                SizedBox(width: 25),
              ],
            ),
          ],
        )
      ),
    );
  }
}
