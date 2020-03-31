import 'package:firebase_auth/firebase_auth.dart';
import 'package:text_adventures/models/user.dart';


class Authenticator
{
  final FirebaseAuth auth = FirebaseAuth.instance;

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
      print("Registering the data.."); // debug
      AuthResult result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      print("User is registered!"); // debug
      // NOTE: it will pass data to the UserLogin function. 
      return userFromFirebase(user);
    }
    catch(e)
    {
      print("ERROR: $e"); // debug
    }
  }

  // this is the function that signs out the user.
  Future signOut() async
  {
    print("Attempting to sign out..."); // debug
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
      print("Succesfully logged in!"); // debug
      FirebaseUser user = result.user;
      return userFromFirebase(user);
    }
    catch(e)
    {
      return "Failed!";
    }
  }



}