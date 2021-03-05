import 'dart:convert';

import 'package:demo_architecture/feature/data/datasources/remotesources/user_inform_remote_data.dart';
import 'package:demo_architecture/feature/data/models/user_inform.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../core/fixture/reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  UserInformRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = UserInformRemoteDataSourceImpl(client: mockHttpClient);
  });

  final userInformModel = UserInformModel.fromJson(json.decode(fixture('userinform_response.json')));
  group('getConcreteNumberTrivia', ()
  {
    test(
      'should preform a GET request on a URL with number being the endpoint and with application/json header',
          () async {
        //arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
              (_) async =>
              http.Response(fixture('userinform_response.json'), 200),
        );
        // act
        final result = await dataSource.getUserInform();
        // assert
        verify(mockHttpClient.get(
          'https://togetherapis.herokuapp.com/api/v1',
          headers: {'Content-Type': 'application/json',
                    'auth-token' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZmU5Y2I2MTgzZDI1NzAwMTc1Y2Q2NzAiLCJpYXQiOjE2MDkyMDk5NTF9.KMk3lR47UC2kBz2m1t70WxFhRpSPz0TJ4yjHzLTd-Zs'
          },
        ));
      },
    );
  }
  );
}

