import 'package:flutter_test/flutter_test.dart';
import 'package:pokeapp/calls/pokemon_API.dart';
import 'package:pokeapp/consts/const_api.dart';
import 'package:pokeapp/models/factories/Pokemon/pokemon_model.dart';

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
