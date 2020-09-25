import 'package:flutter/widgets.dart';

import '../../consts/const_api.dart';
import '../../models/factories/Pokemon/pokemon_model.dart';
import '../../models/factories/Query/query_p_model.dart';
import '../pokemon_API.dart';

class PokemonProvider extends ChangeNotifier {
  List<PokemonModel> _pokemonsList = new List<PokemonModel>();

  QueryPModel _pageModel;

  List<PokemonModel> get pokemonList => _pokemonsList;

  QueryPModel get pageModel => _pageModel;

  void createListPokemon() async {
    try {
      _pageModel = await PokemonApiCall().getQuery(ConstsAPI.pokeApiListUrl);

      _pokemonsList =
          await PokemonApiCall().createListPokemons(ConstsAPI.pokeApiListUrl);
      notifyListeners();
    } catch (createError) {
      print('First list error ' + createError);
    } finally {
      print('Finish Get Initial List');
    }
  }

  void fetchPokemon(String url) async {
    try {
      _pokemonsList
        ..addAll(await PokemonApiCall().createListPokemons(_pageModel.next));

      _pageModel = await PokemonApiCall().getQuery(url);
      notifyListeners();
    } catch (fetchError) {
      print('Fetching List error: ' + fetchError);
    } finally {
      print('Finish List Fetch');
    }
  }
}
