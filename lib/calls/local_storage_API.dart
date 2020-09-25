import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/factories/User/user_model.dart';

abstract class PokemonBase {
  Future<UserModel> setData(UserModel userModel);

  Future<bool> isLogged();

  Future<UserModel> getUser();

  Future logOut();

  Future<bool> getJustInstalled();

  Future setJustInstalled();

  Future signUpEmailPassword(String email, String password);

  Future login();
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
    } else {
      UserModel user =
          UserModel.fromJson(json.decode(localStorage.get('user')));
      return user;
    }
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

  @override
  Future<bool> getJustInstalled() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.get('installed') == null ? false : true;
  }

  @override
  Future setJustInstalled() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setBool('installed', true);
  }

  @override
  Future signUpEmailPassword(String email, String password) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString(
      'user',
      json.encode(
        UserModel(
          email: email,
          password: password,
          id: 0,
          isLogged: true,
        ).toJson(),
      ),
    );
    return email;
  }

  @override
  Future login() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    UserModel user =
        UserModel.fromJson(json.decode(localStorage.getString('user')));
    localStorage.setString(
      'user',
      json.encode(
        UserModel(
          email: user.email,
          password: user.password,
          id: 0,
          isLogged: true,
        ).toJson(),
      ),
    );
  }
}
