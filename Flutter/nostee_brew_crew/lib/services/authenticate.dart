import 'package:firebase_auth/firebase_auth.dart';
import 'package:nostee_brew_crew/models/user.dart';
import 'package:nostee_brew_crew/services/database.dart';

// NOTE: The functions here will be called by loaders.

// this is a class that holds all authentication process
class Authenticate
{
  final FirebaseAuth fba = FirebaseAuth.instance;

  User currentUser(FirebaseUser user)
  {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user
  {
    return fba.onAuthStateChanged.map(currentUser);
  }

  // this is an anonymous sign-in function
  Future<dynamic> signInAnon() async 
  {
    try
    {
      AuthResult result = await fba.signInAnonymously();
      FirebaseUser user = result.user;
      return currentUser(user);
    }
    catch(e)
    {

    }
  }
  // this is a sign-out function
  Future signOut() async
  {
    fba.signOut();
  }

  // this is register function
  Future register(String email,String password) async
  {
    try
    {
      AuthResult result = await fba.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      await Database(uid: user.uid).updateUserData('0','New Member',50);

      return currentUser(user);
    }
    catch(e)
    {
      return "Failed!";
    }
  }

  // this is login function
  Future login(String email,String password) async
  {
    try
    {
      AuthResult result = await fba.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return currentUser(user);
    }
    catch(e)
    {
      return "Failed!";
    }
  }
}