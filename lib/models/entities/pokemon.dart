import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'types_p.dart';

class Pokemon extends Equatable {
  final int baseExperience;
  final int height;
  final int id;
  final String name;
  final int weight;
  final String urlImage;
  final List<TypesP> types;

  const Pokemon({
    Key key,
    @required this.baseExperience,
    @required this.height,
    @required this.id,
    @required this.name,
    @required this.weight,
    @required this.urlImage,
    @required this.types,
  });

  @override
  List<Object> get props => [
        this.baseExperience,
        this.height,
        this.id,
        this.name,
        this.weight,
        this.urlImage,
        this.types
      ];
}
