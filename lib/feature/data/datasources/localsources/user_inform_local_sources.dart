import 'dart:convert';
import 'dart:developer';
import 'package:demo_architecture/core/error/exceptions.dart';
import 'package:demo_architecture/feature/data/models/user_inform.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserInformLocalData{
  Future<UserInformModel> getUserInform();

  Future<void> cacheUserInform(UserInformModel remoteData) {}

}

const CACHED_USER_INFORM = 'CACHED_USER_INFORM';

class UserInformLocalDataImpl implements UserInformLocalData{

  final SharedPreferences sharedPreferences;

  UserInformLocalDataImpl({@required this.sharedPreferences});
  @override
  Future<void> cacheUserInform(UserInformModel remoteData) {
    return sharedPreferences.setString(
      CACHED_USER_INFORM,
      json.encode(remoteData.toJson()),
    );
  }

  @override
  Future<UserInformModel> getUserInform() {
    final jsonString = sharedPreferences.getString(CACHED_USER_INFORM);
    log(jsonString);
    if (jsonString != null) {
      return Future.value(UserInformModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
  
}