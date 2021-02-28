import 'package:dartz/dartz.dart';
import 'package:demo_architecture/core/error/failures.dart';
import 'package:demo_architecture/core/usecases/usecase.dart';
import 'package:demo_architecture/feature/domain/entities/user/user_inform.dart';
import 'package:demo_architecture/feature/domain/repositories/user/user_inform_repository.dart';
import 'package:flutter/cupertino.dart';

class GetUserInform implements UseCase<UserInform, NoParams> {
  final UserInformRepository repository;
  GetUserInform(@required this.repository);



  @override
  Future<Either<Failure, UserInform>> call(NoParams params) async {
    return await repository.getUserInform();
  }

}