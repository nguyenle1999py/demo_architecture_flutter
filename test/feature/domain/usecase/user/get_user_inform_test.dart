import 'package:dartz/dartz.dart';
import 'package:demo_architecture/core/usecases/usecase.dart';
import 'package:demo_architecture/feature/domain/entities/user/user_inform.dart';
import 'package:demo_architecture/feature/domain/repositories/user/user_inform_repository.dart';
import 'package:demo_architecture/feature/domain/usecase/user/get_user_inform.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserInformRepository  extends Mock implements UserInformRepository{
}

void main(){
  GetUserInform getUserInformUsecase;
  MockUserInformRepository userInformRepository;
  setUp((){
    userInformRepository = MockUserInformRepository();
    getUserInformUsecase = GetUserInform(userInformRepository);
  });
  final userInform = UserInform(fullName: "Nguyen", userName: "nguyendz", email: null, phone: null, gender: null, dateOfBirth: null, address: null, tonGiao: null, relationship: null);
  test("Test get user information", () async {
    when(userInformRepository.getUserInform()).thenAnswer((_)async => Right(userInform));
    final result = await getUserInformUsecase(NoParams());

    // Match
    expect(result, Right(userInform));
    // verify that the method has been called  on the Repository
    verify(userInformRepository.getUserInform());
    // verify only the above method should be called and nothing more
    verifyNoMoreInteractions(userInformRepository);
    },
  );
}
