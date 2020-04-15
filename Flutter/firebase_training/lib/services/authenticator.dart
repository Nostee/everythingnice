import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_training/models/user.dart';

class Authenticator
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user){
      return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user 
  {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future login(String email,String password) async
  {
    try
    {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    }
    catch(e)
    {
      return null;
    }
  }

  Future signOut() async
  {
    try
    {
      _auth.signOut();
    }
    catch(e)
    {
      return null;
    }
  }
}