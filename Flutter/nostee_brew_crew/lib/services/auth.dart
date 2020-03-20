import 'package:firebase_auth/firebase_auth.dart';
import 'package:nostee_brew_crew/models/user.dart';

class Auth
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user){
      return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get id 
  {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future signInAnon() async
  {
    try
    {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}