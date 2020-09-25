import 'package:flutter/cupertino.dart';

import '../../entities/Query/type_p.dart';


class TypePModel extends TypeP {
  const TypePModel({
    @required name,
    @required url,
  }) : super(
          name: name,
          url: url,
        );

  factory TypePModel.fromJson(Map<String, dynamic> json) {
    return TypePModel(
        name: json['name'].toString(), url: json['url'].toString());
  }
}
