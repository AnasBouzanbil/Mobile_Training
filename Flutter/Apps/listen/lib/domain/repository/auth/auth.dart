import 'dart:ffi';

abstract class AuthRepository{

  Future<Void> signin();
  Future<Void> signup();


}