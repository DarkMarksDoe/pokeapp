import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/factories/Pokemon/pokemon_model.dart';
import '../models/factories/Query/query_p_model.dart';

abstract class PokemonBase {
  Future<QueryPModel> getQuery(String url);

  Future<PokemonModel> getPokemon(String url);

  Future<List<PokemonModel>> createListPokemons(String url);
}

class PokemonApiCall with PokemonBase {
  @override
  Future<QueryPModel> getQuery(String url) async {
    final http.Response response = await http.get(url);
    final Map<String, dynamic> jsonMap = json.decode(response.body);
    if (response.statusCode == 200) {
      return new QueryPModel.fromJson(jsonMap);
    } else {
      throw Exception('Failed to load pokemon');
    }
  }

  @override
  Future<PokemonModel> getPokemon(String pokemonUrl) async {
    http.Response response;

    response = await http.get(pokemonUrl);

    final Map<String, dynamic> jsonMap = json.decode(response.body);

    if (response.statusCode == 200) {
      return new PokemonModel.fromJson(jsonMap);
    } else {
      throw Exception('Failed to load pokemon');
    }
  }

  Future<List<PokemonModel>> createListPokemons(String urlList) async {
    QueryPModel pokemonListUrl = await PokemonApiCall().getQuery(urlList);
    List<PokemonModel> _pokemonsList = new List<PokemonModel>();
    if (pokemonListUrl == null) {
      throw ('PokemonList empty');
    }
    //exists the query
    for (int j = 0; j < pokemonListUrl.results.length; j++) {
      String urlPokemon = pokemonListUrl.results[j].url;
      _pokemonsList.add(await PokemonApiCall().getPokemon(urlPokemon));
    }
    return _pokemonsList;
  }
}
