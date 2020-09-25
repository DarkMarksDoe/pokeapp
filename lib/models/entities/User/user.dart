import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String password;
  final bool isLogged;

  const User({
    Key key,
    @required this.id,
    @required this.email,
    @required this.password,
    @required this.isLogged,
  });

  @override
  List<Object> get props => [
        this.id,
        this.email,
        this.password,
        this.isLogged,
      ];
}
