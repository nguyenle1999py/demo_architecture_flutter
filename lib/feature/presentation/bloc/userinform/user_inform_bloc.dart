import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:demo_architecture/core/error/failures.dart';
import 'package:demo_architecture/core/usecases/usecase.dart';
import 'package:demo_architecture/feature/domain/entities/user/user_inform.dart';
import 'package:demo_architecture/feature/domain/usecase/user/get_user_inform.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'user_inform_event.dart';
part 'user_inform_state.dart';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';
class UserInformBloc extends Bloc<UserInformEvent, UserInformState> {
  final GetUserInform getUserInform;

   UserInformBloc({
      @required GetUserInform get,
  }):assert(get!=null),
    getUserInform = get;

  @override
  Stream<UserInformState> mapEventToState(
    UserInformEvent event,
  ) async* {
    log("get---"+event.toString());

    if(event is GetForUserInform){
      yield Loading();
      final failureOrTrivia = await getUserInform(
        NoParams(),
      );
      log(failureOrTrivia.toString());
      yield* _eitherLoadedOrErrorState(failureOrTrivia);
      }
  }
  Stream<UserInformState> _eitherLoadedOrErrorState(
      Either<Failure, UserInform> failureOrTrivia,
      ) async* {
    log("---"+failureOrTrivia.toString());
    yield failureOrTrivia.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (userinform) => Loaded(userInform: userinform),
    );
  }


  @override
  // TODO: implement initialState
  UserInformState get initialState => Empty();

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
