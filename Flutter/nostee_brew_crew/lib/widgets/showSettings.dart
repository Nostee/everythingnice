import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/models/user.dart';
import 'package:nostee_brew_crew/services/database.dart';
import 'package:nostee_brew_crew/shared/constants.dart';
import 'package:provider/provider.dart';

class ShowSettings extends StatefulWidget {
  @override
  _ShowSettingsState createState() => _ShowSettingsState();
}

class _ShowSettingsState extends State<ShowSettings> {
  // NOTE: The variables below is for showSettings()
    final formKey = GlobalKey<FormState>();
    final List<String> sugars = ['0','1','2','3','4'];

    String currentName;
    String currentSugars;
    int currentStrength;

  @override
  Widget build(BuildContext context) {
    final dynamic user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
          stream: Database(uid: user.uid).brewData,
          builder: (context,snapshot)
          {
            return Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "UPDATE YOUR BREW SETTINGS.",
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w300
                    )),
                    SizedBox(height: 20),
                    // THIS IS TEXT FIELD
                    TextFormField(
                      initialValue: snapshot.data.name,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: myInputDecoration.copyWith(hintText: "Enter name here."),
                      validator: (val) {
                        return val.isEmpty ? "Please enter a name." : null;
                      },
                      onChanged: (val) {
                        setState(() {
                          currentName = val;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    // THIS IS DROP DOWN
                    DropdownButtonFormField(
                      decoration: myInputDecoration,
                      value: currentSugars ?? snapshot.data.sugars,
                      items: sugars.map((sugar){
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text("$sugar sugar(s)")
                        );
                      }).toList(),
                      onChanged: (val) {
                        currentSugars = val;
                        setState(() {
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      "How strong do you want your coffee?",
                      style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w300
                      ),
                      ),
                    SizedBox(height: 20),
                    // THIS IS SLIDER
                    Slider(
                      value: (currentStrength ?? snapshot.data.strength).toDouble(),
                      activeColor: Colors.brown[currentStrength ?? snapshot.data.strength],
                      inactiveColor: Colors.brown[currentStrength ?? snapshot.data.strength],
                      min: 100,
                      max: 900,
                      divisions: 8,
                      onChanged: (val) {
                      setState(() {
                        currentStrength = val.round();
                        });
                      }
                    ),
                    // THIS IS BUTTON
                    FlatButton(
                      onPressed: () async {
                        if(formKey.currentState.validate())
                        {
                          print(currentName ??  snapshot.data.name);
                          print(currentSugars ?? snapshot.data.sugars);
                          print(currentStrength ?? snapshot.data.strength);

                          await Database(uid: user.uid).updateUserData(
                            currentSugars ?? snapshot.data.sugars, 
                            currentName ??  snapshot.data.name, 
                            currentStrength ?? snapshot.data.strength
                            );
                          Navigator.pop(context);
                        }
                      }, 
                      color: Colors.black87,
                      child: Text(
                        "UPDATE",
                        style: TextStyle(
                          color: Colors.white
                        ) 
                        )
                      )

                ],
              )
            )
          );
          }
          
    );
  }
}