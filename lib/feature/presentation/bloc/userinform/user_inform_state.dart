part of 'user_inform_bloc.dart';
@immutable
abstract class UserInformState extends Equatable {
  UserInformState([List props = const <dynamic>[]]) : super(props);
}

class UserInformInitial extends UserInformState {
  @override
  List<Object> get props => [];
}


class Empty extends UserInformState {}

class Loading extends UserInformState {}

class Loaded extends UserInformState {
  final UserInform userInform;

  Loaded({@required this.userInform}) : super([userInform]);

}

class Error extends UserInformState {
  final String message;

  Error({@required this.message}) : super([message]);
}
