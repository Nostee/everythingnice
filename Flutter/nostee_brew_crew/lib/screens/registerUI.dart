import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/shared/constants.dart';

class RegisterUI extends StatefulWidget {
  @override
  _RegisterUIState createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {

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
            // this is first row (REGISTER FORM)
            Padding(
              padding: const EdgeInsets.fromLTRB(30,170,30,0),
              child: Form(
                key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Register an account now.",
                        style: TextStyle(
                          fontSize: 50,
                        ),
                        ),
                        SizedBox(height: 30),
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
                      // NOTE: Register Button
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // NOTE: Error Text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                            errorMessage,
                            style: TextStyle(
                              color: Colors.red
                            ),
                          )
                          ],
                        ),
                        SizedBox(width: 50),
                        FlatButton(
                          onPressed: () async{
                            print("Email is $email");
                            print("Password is $password");
                            if(formKey.currentState.validate())
                            {
                              dynamic data = await Navigator.pushNamed(context,"/LoadingRegister",arguments: 
                              {
                                "email" : email,
                                "password" : password,
                              }
                              );
                              if(data["data"]=="Failed!")
                              {
                                errorMessage = "Please enter a valid email.";
                                setState(() {
                                });
                              }
                              else
                              {
                                Navigator.pop(context);
                              }
                            }
                          }, 
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w300,
                            ),
                            ),
                        ),
                      ],
                      ),
                      // NOTE: Back Button
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                        onPressed: () {
                          Navigator.pop((context),{});
                        },
                        child: Text(
                          "GO BACK",
                          style: TextStyle(
                                fontSize: 30,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w300,
                              ),
                          ) 
                        )
                      ],
                      ),
                      SizedBox(height: 30),
                    ],
                  )
              ),
            ),
          ],
        )
      ),
    );
  }
}
