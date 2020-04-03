import 'package:flutter/material.dart';

  // this is the register interface

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key key,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final formKey = GlobalKey<FormState>();
  Map temporaryData;
  String email;
  String password;
  String username;
  String error = "";
  String tip = "Note: This is also your username.";
  bool toggle1 = true;
  bool toggle2 = true;

  void register()
  {
    if(formKey.currentState.validate())
    {
      Navigator.pushReplacementNamed(context, "loaderRegister.dart", arguments: {
        "email": email,
        "password": password,
        "username": username,
      });
    }
    else
    {
      print("(register.dart)Validation results: Failed."); // debug
      tip = "";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    try
    {
      temporaryData = ModalRoute.of(context).settings.arguments;
      error = temporaryData["error"];
    }
    catch(e)
    {}
    return Form(
      key: formKey,
      child: Padding(
      padding: const EdgeInsets.all(40),
      child: ListView(
        children: <Widget> [
          SizedBox(height: 10,),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset("assets/formWizard.gif"),
            SizedBox(height: 20,),
            Center(child: Text(
              "None shall pass!",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white
              )
              )),
            Center(child: Text(
            "Unless you fill up this \n   form, of course.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white
            )
            )),
            SizedBox(height: 45,),
            TextFormField(
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
                fontSize: 20
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                  obscureText: toggle1,
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
                  decoration: InputDecoration(
                    filled : true,
                    fillColor: Colors.white70,
                    hintText: "Password",
                  ),
                  style: TextStyle(
                    fontSize: 20
                  ),
                 ),
                ),
                IconButton(
                  onPressed: () {
                    if(toggle1==true)
                    {
                      toggle1=false;
                    }
                    else{
                      toggle1=true;
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.remove_red_eye),
                  color: Colors.white70,
                )
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: <Widget>[
              Expanded(
                  child: TextFormField(
                  obscureText: toggle2,
                  validator: (val) {
                    if(val=="")
                    {
                      return "Empty password.";
                    }
                    else if(val!=password)
                    {
                      return "Please re-enter your password.";
                    }
                    else
                    {
                      password = val;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    filled : true,
                    fillColor: Colors.white70,
                    hintText: "Confirm Password",
                  ),
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    if(toggle2==true)
                    {
                      toggle2=false;
                    }
                    else{
                      toggle2=true;
                    }
                    setState(() {});
                  },
                  icon: Icon(Icons.remove_red_eye),
                  color: Colors.white70,
              )
              ],
            ),
            SizedBox(height: 15,),
            TextFormField(
              validator: (val) {
                if(val=="")
                {
                  return "Empty username.";
                }
                else
                {
                  username = val;
                  return null;
                }
              },
              decoration: InputDecoration(
                filled : true,
                fillColor: Colors.white70,
                hintText: "You want to be called as..?",
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: 5,),
            Text(
              tip,
              style: TextStyle(
                color: Colors.greenAccent
              )
            ),
            SizedBox(height: 15,),
            Center(
              child: FlatButton(
                color: Colors.black,
                onPressed: () async{register();},
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                  ),
                )
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(error,style: TextStyle( 
                  color: Colors.redAccent
                )
              ),
            ),
          ],
        )
        ]
      ),
    ),
    );
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Create an account.")
      ),
      body: RegisterForm()
    );
  }
}