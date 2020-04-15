import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_training/models/chat.dart';

class Database
{
  String uid;
  String roomID;
  Database({this.uid,this.roomID});
  bool exists = false;

  final CollectionReference basicInfo = Firestore.instance.collection('Basic Info');
  final CollectionReference chat = Firestore.instance.collection('Chat');
  Future createData(String name,int age) async 
  {
      try
      {
        DocumentReference ref = await basicInfo.add({
        "name" : name,
        "age" : age,
        });
        print(ref.documentID);
      }
      catch(e)
      {
        print("Failed!");
      }
  }

  Future setData(String name,int age) async
  {
    try
    {
      await basicInfo.document(uid).setData({
      "name" : name,
      "age" : age,
      });
    }
    catch(e)
    {
      print("Failed!");
    }
  }

  Future readData() async 
  {
    try
    {
      DocumentSnapshot ds = await basicInfo.document(uid).get();
      print(ds.data);
    }
    catch(e)
    {
      
    }
  }

  Future deleteData() async
  {
    try
    {
      await basicInfo.document(uid).delete();
    }
    catch(e)
    {
      print("Failed!");
    }
  }

  Future previewDocuments() async
  {
    try
    {
      basicInfo.snapshots().map((x){
        x.documents.map((z){
          print("Document ID: ${z.documentID}");
          print("Datas: ${z.data}");
        }).toList();
      }).toList();
    }
    catch(e)
    {
      print("Failed!");
    }
  }

  Future checkName(String check) async
  {
    try
    {
      basicInfo.snapshots().map((x){
        x.documents.map((z){
          if(z.data["name"]==check)
          {
            print("Data exists!");
          }
        }).toList();
      }).toList();
    }
    catch(e)
    {
      print("Failed!");
    }
  }

  Chat processMessages(DocumentSnapshot snapshot)
  {
    try
    {
      return Chat(
      messages: snapshot.data["message"]
      );
    }
    catch(e)
    {
      print("Room doesn't exist.");
      return null;
    }
  }
    
  Stream<Chat> get messages 
  {
    if(roomID!="0")
    {
      return chat.document(roomID).snapshots().map(processMessages);
    }
    else
    {
      print("Please enter a room number.");
      return null;
    }
  }

  Future<String> getName() async 
  {
    try
    {
      DocumentSnapshot ds = await basicInfo.document(uid).get();
      return ds.data["name"];
    }
    catch(e)
    {
      return null;
    }
  }

  Future<String> getDate() async 
  {
    try
    {
      var now = DateTime.now();
      return now.toString();
    }
    catch(e)
    {
      return null;
    }
  }

  Future sendMessage(String user,String message,String date) async
  {
    try
    {
      print("Your name is $user");
      print("Your message is $message");
      print("Your date is $date");
      print("Room ID is $roomID");

      Map messageInfo = {"time":"$date","message":"$message","user": "$user",};
      print("Message Description is $messageInfo");

      DocumentSnapshot ds = await chat.document(roomID).get();
      var currentArray = ds.data;
      print("Fetched Data: $currentArray");
      List currentList = currentArray["message"].toList();
      print("First item of the list: ${currentList[0]}");

      if(currentList.length>30)
      {
        currentList.removeAt(0);
      }

      currentList.add(messageInfo);
      //Map updatedList = {"message": currentList};
      //print("Updated Data: $updatedList");
      await chat.document(roomID).setData({
      "message" : currentList,
      });

    }
    catch(e)
    {
      print("Error!");
    }
  }
}