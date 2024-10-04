import 'package:flutter/material.dart';


class CreateUserReq
{
  String ? userId;
  String ? fullName;
  String ? email;
  String ? password;



  CreateUserReq({
    this.email,
    this.fullName,
    this.userId
  });
}