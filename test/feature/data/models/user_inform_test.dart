


import 'dart:convert';

import 'package:demo_architecture/feature/data/models/user_inform.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../core/fixture/reader.dart';

void main() {
  final tNumberTriviaModel = UserInformModel(username: "nguyenpy@gmail.com", email:  null);

  group('fromJson', () {
  test(
  'should return a valid model when the JSON number is an integer',
  () async {
  // arrange
  final Map<String, dynamic> jsonMap =
  json.decode(fixture('userinform_response.json'));
  // act
  final result = UserInformModel.fromJson(jsonMap);
  // assert
  expect(result, tNumberTriviaModel);
  },
  );
  });
}