import 'package:equatable/equatable.dart';

class TypeP extends Equatable {
  final String name;
  final String url;
  const TypeP({
    this.name,
    this.url,
  });
  @override
  List<Object> get props => [
        this.name,
        this.url,
      ];
}
