import 'package:flutter/material.dart';

class CreateUserReq {
  String? userId;
  String? fullName;
  final String email; // Make it non-nullable
  final String password; // Make it non-nullable

  CreateUserReq({
    required this.email, // Mark as required
    required this.password, // Mark as required
    this.fullName,
    this.userId,
  });
}
