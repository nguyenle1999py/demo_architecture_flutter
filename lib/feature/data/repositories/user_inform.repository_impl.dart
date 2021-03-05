

 import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:demo_architecture/core/error/exceptions.dart';
import 'package:demo_architecture/core/error/failures.dart';
import 'package:demo_architecture/core/platform/network_infor.dart';
import 'package:demo_architecture/feature/data/datasources/localsources/user_inform_local_sources.dart';
import 'package:demo_architecture/feature/data/datasources/remotesources/user_inform_remote_data.dart';
import 'package:demo_architecture/feature/domain/entities/user/user_inform.dart';
import 'package:demo_architecture/feature/domain/repositories/user/user_inform_repository.dart';
import 'package:flutter/cupertino.dart';

class UserInformRepoImpl implements UserInformRepository{
  final UserInformLocalData userInformLocalData;
  final UserInformRemoteData userInformRemoteData;
  final NetworkInfo networkInfo;

  UserInformRepoImpl({@required this.userInformLocalData, @required this.userInformRemoteData, @required this.networkInfo});



  @override
  Future<Either<Failure, UserInform>> getUserInform() async {

    if( await networkInfo.isConnected){
        try{
          final remoteData = await userInformRemoteData.getUserInform();
          userInformLocalData.cacheUserInform(remoteData);
          return Right(UserInform(userName:remoteData.username, email:remoteData.email));
        }on ServerException{
          return Left(ServerFailure());
        }
    }
    else{
      try{
        final localData = await userInformLocalData.getUserInform();
        log(localData.username);
        return Right(UserInform(userName:localData.username, email:localData.email));
      }on CacheException{
        return Left(CacheFailure());
      }
    }
  }

}