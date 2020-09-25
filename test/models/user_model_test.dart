import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokeapp/calls/local_storage_API.dart';
import 'package:pokeapp/models/factories/User/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  
  SharedPreferences localStorage = await SharedPreferences.getInstance();

  final UserModel tUserModel = UserModel(
    id: 1,
    email: '123',
    password: '123',
    isLogged: false,
  );

  group(
    'fromJson',
    () {
      test(
        'User fromJsom',
        () async {
          final Map<String, dynamic> jsonMap =
              json.decode(localStorage.get('user'));
          final result = UserModel.fromJson(jsonMap);
          expect(result, tUserModel);
        },
      );
      test(
        'getUser log info',
        () async {
          print(await LocalStorageApiCall().isLogged());
          expect(await LocalStorageApiCall().isLogged(), false);
        },
      );
      test(
        'setUser logged',
        () async {
          UserModel tUserModel = await LocalStorageApiCall().getUser();
          UserModel temporalUser = new UserModel(
            id: tUserModel.id,
            email: tUserModel.email,
            password: tUserModel.password,
            isLogged: true,
          );
          LocalStorageApiCall().setData(temporalUser);
          expect(await LocalStorageApiCall().isLogged(), true);
          print('test setUser:' +
              (await LocalStorageApiCall().isLogged()).toString());
        },
      );
    },
  );
}
