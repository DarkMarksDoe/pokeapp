import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../calls/provider/provider_pokemon.dart';
import '../../models/entities/types_p.dart';
import '../PokemonPage/pokemon_description_page.dart';
import 'widgets/cardPokemon.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Gotta Catch \'Em All!'),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Consumer<PokemonProvider>(
          builder: (_, snapshot, __) {
            if (snapshot.pokemonList.length == 0)
              return Center(child: CircularProgressIndicator());
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(12),
              addAutomaticKeepAlives: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 3),
              itemCount: snapshot.pokemonList.length + 1,
              itemBuilder: (context, index) {
                if (index < snapshot.pokemonList.length) {
                  List<String> typesPokemon =
                      _getTypes(snapshot.pokemonList[index].types);
                  return GestureDetector(
                    child: CardPokemon(
                        pokemonIndex: index + 1,
                        types: typesPokemon,
                        name: snapshot.pokemonList[index].name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PokemonDescriptionPage(
                              pokemonModel: snapshot.pokemonList[index],
                              pokemonTypes: typesPokemon),
                        ),
                      );
                    },
                  );
                } else if (snapshot.pokemonList[index - 1].id < 1050) {
                  //Theres is more info
                  snapshot.fetchPokemon(snapshot.pageModel.next);
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: Text('There is no more pokemons'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<String> _getTypes(List<TypesP> types) {
    List<String> typesString = new List<String>();
    types.forEach(
      (typeModel) {
        typesString.add(typeModel.type.name.toString());
      },
    );
    return typesString;
  }
}
