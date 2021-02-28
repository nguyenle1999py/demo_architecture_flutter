import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserInform extends Equatable{
  final String fullName;
  final String userName;
  final String email;
  final String phone;
  final String gender;
  final String dateOfBirth;
  final String address;
  final String relationship;
  final String tonGiao;

  UserInform({
    @required this.fullName,
    @required this.userName,
    @required this.email,
    @required this.phone,
    @required this.gender,
    @required this.dateOfBirth,
    @required this.address,
    @required this.tonGiao,
    @required this.relationship
  }):super([userName]);
}