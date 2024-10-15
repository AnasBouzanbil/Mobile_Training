

import 'package:listen/data/models/auth/create_user_req.dart';
import 'package:listen/data/sources/auth/Firebase.auth.service.dart';
import 'package:listen/domain/repository/auth/auth.dart';
import 'package:listen/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<void> signin(CreateUserReq createuserReq)async  {

  }

  @override
  Future<void> signup(CreateUserReq createuserReq)  async {

      await  sl<AuthFirebaseService>().signup(createuserReq);


  }

}