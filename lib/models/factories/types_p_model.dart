import 'package:flutter/material.dart';

import '../entities/types_p.dart';
import 'type_p_model.dart';

class TypesPModel extends TypesP {
  const TypesPModel({@required slot, @required type})
      : super(
          slot: slot,
          type: type,
        );

  factory TypesPModel.fromJson(Map<String, dynamic> json) {
    final TypePModel typeModel = new TypePModel.fromJson(
      (json['type']),
    );

    return new TypesPModel(
      slot: json['slot'],
      type: typeModel,
    );
  }
}
