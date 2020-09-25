import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String name;
  final String url;

  const Item({
    this.name,
    this.url,
  });

  @override
  List<Object> get props => [
        this.name,
        this.url,
      ];
}
