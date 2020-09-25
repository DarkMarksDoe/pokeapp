import 'dart:convert';

import 'package:pokeapp/models/factories/User/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PokemonBase {
  Future<UserModel> setData(UserModel userModel);

  Future<bool> isLogged();

  Future<UserModel> getUser();

  Future logOut();
}

class LocalStorageApiCall with PokemonBase {
  @override
  Future<UserModel> setData(UserModel userModel) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString(
      'user',
      json.encode(
        userModel.toJson(),
      ),
    );
    return userModel;
  }

  @override
  Future<bool> isLogged() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (localStorage.get('user') == null) {
      return false;
    }
    UserModel user = UserModel.fromJson(json.decode(localStorage.get('user')));
    return user.isLogged;
  }

  @override
  Future<UserModel> getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.get('user');
    if (userJson == null) {
      return null;
    }
    UserModel user = UserModel.fromJson(json.decode(localStorage.get('user')));
    return user;
  }

  @override
  Future logOut() async {
    UserModel user = await LocalStorageApiCall().getUser();
    UserModel temporalUser = new UserModel(
      id: user.id,
      email: user.email,
      password: user.password,
      isLogged: false,
    );
    await setData(temporalUser);
  }
}
