import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pokeapp/models/factories/Query/item_model.dart';
import 'package:pokeapp/models/factories/Query/query_p_model.dart';

void main() {
  final ItemModel itemModel =
      ItemModel(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/');

  final List<ItemModel> tListPokemonModel = [itemModel];

  final QueryPModel tQueryModel = QueryPModel(
      count: 1050,
      next: 'https://pokeapi.co/api/v2/pokemon?offset=1&limit=1',
      previous: '',
      results: tListPokemonModel);
  test('Should be a subclass of Query List', () async {
    //assert
    expect(tQueryModel, isA<QueryPModel>());
  });

  group(
    'fromJson',
    () {
      test(
        'should return a valid model when call API',
        () async {
          // arrange
          // make GET request
          final String url = 'https://pokeapi.co/api/v2/pokemon?limit=1';
          final Response response = await get(url);
          final Map<String, dynamic> jsonMap = json.decode(response.body);
          // act
          final result = QueryPModel.fromJson(jsonMap);
          // assert
          expect(result, tQueryModel);
        },
      );
    },
  );
}
