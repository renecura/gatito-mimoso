import 'package:flutter/material.dart';

enum Patron { gente, casta, fuerzas, establishment }

enum AccionCarta { nada, aceptar, rechazar, postergar }

const int gente = 0;
const int casta = 1;
const int fuerzas = 2;
const int establishment = 3;

final List<Color> patronColors = [
  Colors.red.shade900,
  Colors.amber,
  Colors.green.shade800,
  Colors.deepPurple,
];

final List<IconData> patronIcons = [
  Icons.group,
  Icons.supervisor_account,
  Icons.military_tech,
  Icons.account_balance,
];
