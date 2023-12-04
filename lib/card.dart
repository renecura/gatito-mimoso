import 'package:flutter/material.dart';
import 'package:gatito_mimoso/models/card_type.dart';
import 'game.dart';
import 'models/card_model.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  final Game game;

  botonesPatron() => [
        IconButton(
          disabledColor: Colors.grey,
          color: Colors.red,
          iconSize: 48,
          icon: const Icon(Icons.cancel),
          onPressed: !card.rechazar ? null : game.rechazar,
        ),
        IconButton(
          disabledColor: Colors.grey,
          color: Colors.blue,
          iconSize: 48,
          icon: const Icon(Icons.watch_later),
          onPressed: !card.postergar ? null : game.postergar,
        ),
        IconButton(
          disabledColor: Colors.grey,
          color: Colors.green,
          iconSize: 48,
          icon: const Icon(Icons.check_circle),
          onPressed: !card.aceptar ? null : game.aceptar,
        ),
      ];

  botonesEvento() => [
        IconButton(
          disabledColor: Colors.grey,
          color: Colors.grey.shade800,
          iconSize: 48,
          icon: const Icon(Icons.backspace),
          onPressed: !card.rechazar ? null : game.rechazar,
        ),
        IconButton(
          disabledColor: Colors.grey,
          color: Colors.grey.shade800,
          iconSize: 48,
          icon: const Icon(Icons.announcement),
          onPressed: !card.aceptar ? null : game.aceptar,
        ),
      ];

  const CardWidget({
    required this.card,
    required this.game,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: card.tipo.color,
                ),
              ),
              //child: const Icon(Icons.money),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  card.titulo,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  card.descripcion,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ), // Descripción
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: card.tipo == tipoEvento
                      ? botonesEvento()
                      : botonesPatron(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
