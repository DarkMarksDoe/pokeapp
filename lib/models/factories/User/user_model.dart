import 'package:flutter/widgets.dart';

import '../../entities/User/user.dart';

class UserModel extends User {
  const UserModel({
    @required id,
    @required email,
    @required password,
    @required isLogged,
  }) : super(
          id: id,
          email: email,
          password: password,
          isLogged: isLogged,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      isLogged: json['isLogged'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['isLogged'] = this.isLogged;
    return data;
  }
}
