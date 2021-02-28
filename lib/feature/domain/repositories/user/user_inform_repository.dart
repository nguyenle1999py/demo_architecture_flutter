import 'package:dartz/dartz.dart';
import 'package:demo_architecture/core/error/failures.dart';
import 'package:demo_architecture/feature/domain/entities/user/user_inform.dart';

abstract class UserInformRepository {

  Future<Either<Failure, UserInform>> getUserInform();
}