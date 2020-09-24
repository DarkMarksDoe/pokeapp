import 'package:equatable/equatable.dart';
import 'package:pokeapp/models/entities/type_p.dart';

class TypesP extends Equatable {
  final int slot;
  final TypeP type;

  const TypesP({
    this.slot,
    this.type,
  });
  @override
  List<Object> get props => [
        this.slot,
        this.type,
      ];
}
