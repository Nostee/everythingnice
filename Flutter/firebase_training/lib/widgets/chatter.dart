import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_training/models/chat.dart';

class Chatter extends StatefulWidget {
  @override
  _ChatterState createState() => _ChatterState();
}

class _ChatterState extends State<Chatter> {
  @override
  Widget build(BuildContext context) {
    try
    {
      final dynamic messageInfo = Provider.of<Chat>(context); 
      var chats = messageInfo.messages;
      //print("Fetched Message: $chats");
      //print("Number of Messages: ${chats.length}");
      return Container(
        color: Colors.blue,
        height: 300,
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context,index) {
            return Text(
              "${chats[index]["user"]} - ${chats[index]["message"]} - (${chats[index]["time"]})"
            );
          },
          )
      );
    }
    catch(e)
    {
      print("Room is not found...");
      return Container(
        color: Colors.red,
        height: 300
      );
    }
  }
}