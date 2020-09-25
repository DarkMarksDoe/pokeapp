import 'package:flutter/material.dart';

import '../../entities/Pokemon/pokemon.dart';
import '../Query/types_p_model.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    @required baseExperience,
    @required height,
    @required id,
    @required name,
    @required weight,
    @required urlImage,
    @required types,
  }) : super(
          baseExperience: baseExperience,
          height: height,
          id: id,
          name: name,
          weight: weight,
          urlImage: urlImage,
          types: types,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final List<TypesPModel> typeList = new List<TypesPModel>();
    if (json['types'] != null) {
      json['types'].forEach(
        (json) {
          typeList.add(new TypesPModel.fromJson(json));
        },
      );
    }
    return new PokemonModel(
      baseExperience: json['base_experience'],
      height: json['height'],
      id: json['id'],
      name: json['name'],
      weight: json['weight'],
      urlImage:
          'https://pokeres.bastionbot.org/images/pokemon/${json['id']}.png',
      types: typeList,
    );
  }
}
