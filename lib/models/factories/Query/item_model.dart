import 'package:flutter/material.dart';

import '../../entities/Query/item.dart';

class ItemModel extends Item {
  const ItemModel({
    @required name,
    @required url,
  }) : super(
          name: name,
          url: url,
        );

  factory ItemModel.itemFromJson(Map<String, dynamic> json) {
    return new ItemModel(
      url: json['url'].toString(),
      name: json['name'].toString(),
    );
  }
}
