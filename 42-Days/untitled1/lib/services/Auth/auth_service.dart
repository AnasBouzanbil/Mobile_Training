

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Authservice{


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  User? getCurrentUser(){
    return _auth.currentUser;
  }


  // signin
Future<UserCredential> SigninUsingPassEmail(String email, pass) async
{
  try {
    UserCredential _usecred = await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return _usecred;
  }
  on FirebaseAuthException catch(e) {
    throw Exception(e);
  }
}
// SIGNUP
  Future<UserCredential> SignupWithEmailAndPass(String email, pass)async
  {
    try {
      UserCredential _userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: pass);

      await _firestore.collection("Users").doc(_userCredential.user!.uid).set({
        'uid': _userCredential.user!.uid,
        'email': email,
      });

      return _userCredential;
    } catch (e) {
      print("Firestore Error: $e");  // Full error message
      throw Exception("Unable to sign up. Error: $e");
    }
  }


//signout

Future<void> signout() async{

  return await _auth.signOut();

}

}