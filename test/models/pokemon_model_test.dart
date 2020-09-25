import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pokeapp/models/factories/Pokemon/pokemon_model.dart';
import 'package:pokeapp/models/factories/Query/type_p_model.dart';
import 'package:pokeapp/models/factories/Query/types_p_model.dart';

void main() {
  final TypePModel newType =
      new TypePModel(name: 'grass', url: 'https://pokeapi.co/api/v2/type/12/');
  final TypePModel newType2 =
      new TypePModel(name: 'poison', url: 'https://pokeapi.co/api/v2/type/4/');
  final List<TypesPModel> typeList = [
    TypesPModel(slot: 1, type: newType),
    TypesPModel(slot: 2, type: newType2)
  ];
  final tPokemonModel = PokemonModel(
      types: typeList,
      weight: 69,
      baseExperience: 64,
      height: 7,
      id: 1,
      urlImage: 'https://pokeres.bastionbot.org/images/pokemon/1.png',
      name: 'bulbasaur');
  test('Should be a subclass of Pokemon Model', () async {
    //assert
    expect(tPokemonModel, isA<PokemonModel>());
  });

  group(
    'fromJson',
    () {
      test(
        'should return a valid model when call API',
        () async {
          // arrange
          // make GET request
          final String url = 'https://pokeapi.co/api/v2/pokemon/1';
          final Response response = await get(url);
          final Map<String, dynamic> jsonMap = json.decode(response.body);
          // act
          final result = PokemonModel.fromJson(jsonMap);
          // assert
          expect(result, equals(tPokemonModel));
        },
      );
    },
  );
}
