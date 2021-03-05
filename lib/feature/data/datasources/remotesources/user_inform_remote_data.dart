
import 'dart:convert';
import 'dart:developer';

import 'package:demo_architecture/core/error/exceptions.dart';
import 'package:demo_architecture/core/platform/api_base.dart';
import 'package:demo_architecture/core/platform/api_path.dart';
import 'package:demo_architecture/feature/data/models/user_inform.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class UserInformRemoteData{
  Future<UserInformModel> getUserInform();

}

class UserInformRemoteDataSourceImpl implements UserInformRemoteData{
  final http.Client client;

  UserInformRemoteDataSourceImpl({@required this.client});

  @override
  Future<UserInformModel> getUserInform() => _getUserInformUrl(APIBase.baseURL+APIPathHelper.getValue(APIPath.fetch_user));



  Future<UserInformModel> _getUserInformUrl(String url) async {
    log("url: "+url);
    final response = await client.get(
      url,
      headers: {'Content-Type': 'application/json',
        'auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZmU5Y2I2MTgzZDI1NzAwMTc1Y2Q2NzAiLCJpYXQiOjE2MDkyMDk5NTF9.KMk3lR47UC2kBz2m1t70WxFhRpSPz0TJ4yjHzLTd-Zs'
      },
    );


    if (response.statusCode == 200) {
      log("good: "+json.decode(response.body).toString());
      return UserInformModel.fromJson(json.decode(response.body));
    } else {
      log("bad: "+url);
      throw ServerException();
    }
  }
}
