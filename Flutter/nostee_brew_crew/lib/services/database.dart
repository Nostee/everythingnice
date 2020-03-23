import 'package:cloud_firestore/cloud_firestore.dart';

class Database
{
  final String uid;

  Database({this.uid});
  final CollectionReference brews = Firestore.instance.collection("Brews");

  Future updateUserData(String sugars,String name,int strength) async
  {
    return await brews.document(uid).setData({
      "sugars" : sugars,
      "name" : name,
      "strength" : strength,
    });
  }
}