import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nostee_brew_crew/models/flavors.dart';
import 'package:nostee_brew_crew/models/user.dart';

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

  // THIS IS FOR PASSING THE DATA IN THE DATABASE TO A CUSTOM MODEL (ALL USERS)
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

  // THIS IS FOR PASSING THE DATA IN THE DATABASE TO A CUSTOM MODEL (SINGLE USER)
  UserData myUserData(DocumentSnapshot snapshot)
  {
    return UserData(
      uid: uid,
      name: snapshot.data["name"],
      strength: snapshot.data["strength"],
      sugars: snapshot.data["sugars"],
    );
  }

  // THIS IS FOR STREAMING DATA
  Stream<UserData> get brewData{
    return brews.document(uid).snapshots().map(myUserData);
  }
}

  
