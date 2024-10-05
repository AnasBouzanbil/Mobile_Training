import 'package:dartz/dartz.dart';
import 'package:listen/core/usecase/usecase.dart';
import 'package:listen/data/models/auth/create_user_req.dart';

class SignupUseCase implements UseCase<Either , CreateUserReq>{
  @override
  Future<void> call({CreateUserReq ? param}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}