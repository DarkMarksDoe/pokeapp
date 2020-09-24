import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'item.dart';

class QueryP extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<Item> results;

  const QueryP({
    Key key,
    @required this.count,
    @required this.next,
    @required this.previous,
    @required this.results,
  });

  @override
  List<Object> get props => [
        this.count,
        this.next,
        this.previous,
        this.results,
      ];
}
