import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../consts/const_colors.dart';
import '../../models/factories/pokemon_model.dart';

class PokemonDescriptionPage extends StatelessWidget {
  final PokemonModel pokemonModel;
  final List<String> pokemonTypes;
  const PokemonDescriptionPage(
      {Key key, @required this.pokemonModel, @required this.pokemonTypes});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemonModel.name.toUpperCase(),
          style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
        ),
        backgroundColor: ConstColors.getColorType(
          '${pokemonTypes[0]}',
        ),
      ),
      body: Center(
        child: Container(
          color: ConstColors.getColorType('${pokemonTypes[0]}'),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topRight: const Radius.circular(30.0),
                      topLeft: const Radius.circular(30.0),
                    ),
                  ),
                  height: screenHeight * .65,
                  width: screenWidth,
                ),
              ),
              Positioned(
                top: 50,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://pokeres.bastionbot.org/images/pokemon/${pokemonModel.id}.png',
                  height: 180,
                  filterQuality: FilterQuality.low,
                  memCacheHeight: 150,
                  memCacheWidth: 150,
                  fit: BoxFit.contain,
                  errorWidget: (context, string, _) {
                    return Image.asset('assets/images/img2.png');
                  },
                  placeholder: (_, __) {
                    return Image.asset('assets/images/img1.png');
                  },
                ),
              ),
              Positioned(
                left: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    getText(
                        'ID',
                        ConstColors.getColorType('${pokemonTypes[0]}'),
                        pokemonModel.id.toString(),
                        ' '),
                    getText(
                        'Height',
                        ConstColors.getColorType('${pokemonTypes[0]}'),
                        (pokemonModel.height * 10).toString(),
                        'cmts'),
                    getText(
                        'Weight',
                        ConstColors.getColorType('${pokemonTypes[0]}'),
                        (pokemonModel.weight * 10).toString(),
                        'cmts')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getText(String first, Color color, String value, String lastValue) {
    return RichText(
      text: TextSpan(
        text: first + ': ',
        style: TextStyle(fontSize: 28, color: Colors.black87),
        children: <TextSpan>[
          TextSpan(
            text: value,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: color),
          ),
          TextSpan(
            text: ' $lastValue',
            style: TextStyle(fontSize: 28, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
