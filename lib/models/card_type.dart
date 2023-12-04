import 'package:flutter/material.dart';
import 'package:gatito_mimoso/constants.dart';

class CardType {
  String nombre;
  List<Color> color;

  CardType({required this.nombre, required this.color});
}

final CardType tipoCasta = CardType(
  nombre: 'La Casta',
  color: [patronColors[casta], patronColors[casta].withOpacity(0.3)],
);

final CardType tipoFuerzas = CardType(
  nombre: 'Las Fuerzas',
  color: [patronColors[fuerzas], patronColors[fuerzas].withOpacity(0.3)],
);

final CardType tipoEstablishment = CardType(
  nombre: 'El Establishment',
  color: [
    patronColors[establishment],
    patronColors[establishment].withOpacity(0.3)
  ],
);

final CardType tipoEvento = CardType(
  nombre: '¡Evento!',
  color: [patronColors[gente], patronColors[gente].withOpacity(0.3)],
);
