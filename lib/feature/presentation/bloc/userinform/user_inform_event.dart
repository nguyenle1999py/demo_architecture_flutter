part of 'user_inform_bloc.dart';


@immutable
abstract class UserInformEvent extends Equatable {
  UserInformEvent([List props = const <dynamic>[]]) : super(props);

}

class GetForUserInform extends UserInformEvent {
}

