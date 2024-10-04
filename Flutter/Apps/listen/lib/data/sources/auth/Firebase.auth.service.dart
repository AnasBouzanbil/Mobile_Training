import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:listen/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<void> signin();
  Future<void> signup(CreateUserReq  req) ;
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {

  @override
  Future<void> signin() async {
    // Your signin implementation here
  }

  @override
  Future<void> signup(CreateUserReq  req) async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: req.email, password: req.password);
    }on FirebaseAuth catch(e)
    {
      print(e);
    }


  }
}
