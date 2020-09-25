import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../consts/const_colors.dart';

class CardPokemon extends StatelessWidget {
  final int pokemonIndex;
  final List<String> types;
  final String name;
  const CardPokemon(
      {Key key,
      @required this.pokemonIndex,
      @required this.types,
      @required this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 80,
        decoration: new BoxDecoration(
          color: ConstColors.getColorType(
              '${types[0]}'), //new Color.fromRGBO(255, 0, 0, 0.0),
          borderRadius: new BorderRadius.only(
            topRight: const Radius.circular(30.0),
            bottomLeft: const Radius.circular(30.0),
            bottomRight: const Radius.circular(10.0),
            topLeft: const Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://pokeres.bastionbot.org/images/pokemon/$pokemonIndex.png',
                height: 90,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.low,
                memCacheHeight: 200,
                memCacheWidth: 200,
                errorWidget: (context, string, _) {
                  return Image.asset(
                    'assets/images/img2.png',
                    fit: BoxFit.contain,
                  );
                },
                placeholder: (_, __) {
                  return Image.asset(
                    'assets/images/img1.png',
                    fit: BoxFit.contain,
                  );
                },
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 40,
                    width: 200,
                    child: ListView.builder(
                      itemCount: types.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, item) {
                        return Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(left: 10, right: 10),
                          width: 70,
                          decoration: new BoxDecoration(
                            color: Colors.white12,
                            borderRadius: new BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${types[item]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
