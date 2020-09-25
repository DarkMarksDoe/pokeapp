import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'calls/provider/provider_pokemon.dart';
import 'pages/root_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => PokemonProvider()..createListPokemon())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PokeApp',
        home: RootPage(),
      ),
    );
  }
}
