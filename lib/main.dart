import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calls/provider/provider_pokemon.dart';
import 'pages/HomePage/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => PokemonProvider()..createListPokemon())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PokeApp',
        home: HomePage(),
      ),
    );
  }
}
