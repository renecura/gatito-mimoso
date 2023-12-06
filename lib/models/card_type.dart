import 'package:flutter/material.dart';
import 'package:gatito_mimoso/constants.dart';

class CardType {
  String nombre;
  List<Color> color;

  CardType({required this.nombre, required this.color});
}

final CardType tipoCasta = CardType(
  nombre: 'La Casta',
  color: [casta.color, casta.color.withOpacity(0.3)],
);

final CardType tipoFuerzas = CardType(
  nombre: 'Las Fuerzas',
  color: [fuerzas.color, fuerzas.color.withOpacity(0.3)],
);

final CardType tipoEstablishment = CardType(
  nombre: 'El Establishment',
  color: [establishment.color, establishment.color.withOpacity(0.3)],
);

final CardType tipoEvento = CardType(
  nombre: '¡Evento!',
  color: [gente.color, gente.color.withOpacity(0.3)],
);
