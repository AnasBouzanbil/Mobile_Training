

import 'package:listen/data/models/auth/create_user_req.dart';

abstract class AuthRepository{

  Future<void> signin(CreateUserReq createuserReq);
  Future<void> signup(CreateUserReq createuserReq);


}