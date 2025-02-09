
import 'package:dartz/dartz.dart';
import 'package:demo_architecture/core/error/failures.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type,Params>{
  Future<Either<Failure,Type>> call (Params params);
}
class NoParams extends Equatable{}