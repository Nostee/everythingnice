import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nostee_brew_crew/models/flavors.dart';

class Database
{
  final String uid;

  Database({this.uid});
  final CollectionReference brews = Firestore.instance.collection("Brews");

  // THIS IS FOR UPDATING USER DATA
  Future updateUserData(String sugars,String name,int strength) async
  {
    return await brews.document(uid).setData({
      "sugars" : sugars,
      "name" : name,
      "strength" : strength,
    });
  }

  // THIS IS FOR PASSING THE DATA IN THE DATABASE TO A CUSTOM MOODEL
  List<Flavors> flavorList(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc){
      return Flavors(
        name: doc.data["name"],
        strength: doc.data["strength"],
        sugars: doc.data["sugars"]
      );
    }).toList();
  }

  // THIS IS FOR STREAMING DATA
  Stream<List<Flavors>> get info{
    return brews.snapshots().map(flavorList);
  }
}