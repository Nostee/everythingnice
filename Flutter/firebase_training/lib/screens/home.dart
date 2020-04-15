import 'package:firebase_training/models/chat.dart';
import 'package:firebase_training/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_training/services/authenticator.dart';
import 'package:firebase_training/services/database.dart';
import 'package:firebase_training/widgets/chatter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String mockName = "Jedidiah Calayag";
  int mockAge = 20;
  String check;
  String roomID = "0";
  String trueRoomID = "0";

  String message = "";
  String name = "";
  String date = "";

  @override
  Widget build(BuildContext context) {
    final dynamic user = Provider.of<User>(context); 
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: <Widget>[
          RaisedButton(
            child: Text("Sign out"),
            onPressed: () {
              Authenticator().signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            RaisedButton(
              child: Text("Add Data"),
              onPressed: () {
                Database(uid: user.uid).createData(mockName, mockAge);
              },
            ),
            RaisedButton(
              child: Text("Set Data"),
              onPressed: () {
                Database(uid: user.uid).setData(mockName, mockAge);
              },
            ),
            RaisedButton(
              child: Text("Read Data"),
              onPressed: () {
                Database(uid: user.uid).readData();
              },
            ),
            RaisedButton(
              child: Text("Delete Data"),
              onPressed: () {
                Database(uid: user.uid).deleteData();
              },
            ),
            RaisedButton(
              child: Text("Preview Documents"),
              onPressed: () {
                Database(uid: user.uid).previewDocuments();
              },
            ),
            TextFormField(
              onChanged: (val) {
                    check = val;
                  }
            ),
            RaisedButton(
              child: Text("Check if Name Exists"),
              onPressed: () {
                Database(uid: user.uid).checkName(check);
              },
            ),
            Row(
              children: <Widget>[
                Text("Enter Room ID: "),
                Expanded(
                    child: TextFormField(
                    onChanged: (val) {
                      roomID = val;
                    }
                  ),
                ),
                RaisedButton(
                child: Text("Enter"),
                onPressed: () {
                  trueRoomID = roomID;
                  if(trueRoomID=="")
                  {
                    trueRoomID = "0";
                  }
                  setState(() {});
                },
                )
              ],
            ),
            Container(
              color: Colors.blue,
              child: StreamProvider<Chat>.value(
                value: Database(roomID: trueRoomID).messages,
                child: Chatter()
                ),
            ),
            Row(
              children: <Widget>[
                Text("Enter Message: "),
                Expanded(
                    child: TextFormField(
                    onChanged: (val) {
                      message = val;
                    }
                  ),
                ),
                RaisedButton(
                child: Text("Enter"),
                onPressed: () async{
                  name = await Database(uid: user.uid).getName();
                  date = await Database().getDate();
                  await Database(roomID: roomID).sendMessage(name,message,date);
                  setState(() {});
                },
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}