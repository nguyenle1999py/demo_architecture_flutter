

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserInformModel  extends Equatable{
   final String username;
   final String email;

   UserInformModel({@required this.username, @required this.email}):super([username, email]);


  factory UserInformModel.fromJson(Map<String, dynamic> jsonMap) {
    log(jsonMap.toString());
    return UserInformModel(username: jsonMap["data"]["username"] as String, email: jsonMap["data"]["email"] as String);
   }

   Map<String, dynamic> toJson() {
     return {
       "data" : {'username': username,
       'email': email}
     };
   }

}