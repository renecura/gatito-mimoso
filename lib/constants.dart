import 'package:flutter/material.dart';
import 'models/patron_model.dart';

final gente = PatronModel(
  'G',
  Colors.red.shade900,
  Icons.group,
);
final casta = PatronModel(
  'C',
  Colors.amber,
  Icons.supervisor_account,
);
final fuerzas = PatronModel(
  'F',
  Colors.green.shade800,
  Icons.military_tech,
);
final establishment = PatronModel(
  'E',
  Colors.deepPurple,
  Icons.account_balance,
);

final patrones = {
  'G': gente,
  'C': casta,
  'F': fuerzas,
  'E': establishment,
};
PatronModel patron(String id) => patrones[id] ?? patrones['G']!;

enum Patron { gente, casta, fuerzas, establishment }

enum AccionCarta { nada, aceptar, rechazar, postergar }
