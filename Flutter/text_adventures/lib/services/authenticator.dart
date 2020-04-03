import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:text_adventures/models/user.dart';


class Authenticator
{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference characterInformation = Firestore.instance.collection('CharacterInformation');

  String uid;
  Authenticator({this.uid});

  // this is the function that gives the UserLogin model the uid.
  UserLogin userFromFirebase(FirebaseUser user)
  {
    return user != null ? UserLogin(uid: user.uid) : null;
  }

  // this is the function that constanly runs to check if there's an account currently logged in.
  Stream<UserLogin> get user 
  {
    return auth.onAuthStateChanged.map(userFromFirebase);
  }

  // this is the function that registers the user.
  Future register(String email,String password) async
  {
    try
    {
      print("(authenticator.dart)Registering the data.."); // debug
      AuthResult result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      print("(authenticator.dart)User is registered!"); // debug
      // NOTE: it will pass data to the UserLogin function. 
      return userFromFirebase(user); // temporary
    }
    catch(e)
    {
      print("(authenticator.dart)ERROR: $e"); // debug
      return null;
    }
  }

  // this is the function that signs out the user.
  Future signOut() async
  {
    print("(authenticator.dart)Attempting to sign out..."); // debug
    try
    {
      await auth.signOut();
      return "Complete.";
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
  // this is the login function.
  Future login(String email,String password) async
  {
    try
    {
      AuthResult result = await auth.signInWithEmailAndPassword(email: email, password: password);
      print("(authenticator.dart)Succesfully logged in!"); // debug
      FirebaseUser user = result.user;
      return userFromFirebase(user);
    }
    catch(e)
    {
      return "Failed!";
    }
  }

  // temporary
  // this is the function that follows after registering.
  // note: this will pass null data (except for username) to the fields of the CharacterInformation
  Future passNullStarterData(String username) async
  {
    try
    {
      print("(authenticator.dart)Passing the username to the database..."); // debug
      return await characterInformation.document(uid).setData({
      "Username" : username,
      });
    }
    catch(e)
    {
      print("ERROR: $e"); // debug
      return null;
    }
  }
}