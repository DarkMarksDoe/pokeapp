import 'package:flutter/material.dart';

import '../../entities/Query/query_p.dart';
import 'item_model.dart';

class QueryPModel extends QueryP {
  const QueryPModel({
    @required count,
    @required next,
    @required previous,
    @required results,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          results: results,
        );

  factory QueryPModel.fromJson(Map<String, dynamic> json) {
    final List<ItemModel> listItem = new List<ItemModel>();
    if (json['results'] != null) {
      json['results'].forEach(
        (json) {
          listItem.add(new ItemModel.itemFromJson(json));
        },
      );
    }

    return new QueryPModel(
      count: int.parse(json['count'].toString()),
      next: json['next'],
      previous: json['previous'],
      results: listItem,
    );
  }
}
