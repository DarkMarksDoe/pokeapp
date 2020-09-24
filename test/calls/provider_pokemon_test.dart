import 'package:flutter_test/flutter_test.dart';
import 'package:pokeapp/calls/pokemonAPI.dart';
import 'package:pokeapp/consts/const_api.dart';
import 'package:pokeapp/models/factories/pokemon_model.dart';

void main() {
  test(
    'Should be a subclass of Pokemon Model',
    () async {
      //assert
      List<PokemonModel> pokemons =
          await PokemonApiCall().createListPokemons(ConstsAPI.pokeApiUrl);
      pokemons.forEach(
        (modelPokemon) {
          print(modelPokemon.name);
        },
      );
    },
  );
}
