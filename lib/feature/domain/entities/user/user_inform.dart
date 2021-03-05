import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserInform extends Equatable{

  final String userName;
  final String email;


  UserInform({
    @required this.userName,
    @required this.email,
  }):super([userName]);
}