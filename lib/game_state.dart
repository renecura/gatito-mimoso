import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants.dart';

final valorProviders = {
  gente: StateProvider<double>((ref) => 0.5),
  casta: StateProvider<double>((ref) => 0.5),
  fuerzas: StateProvider<double>((ref) => 0.5),
  establishment: StateProvider<double>((ref) => 0.5),
};

final ansiedadProvider = StateProvider<int>((ref) => 2);

final deckProvider =
    StateProvider<List<String>>((ref) => ['C001', 'E001', 'F001', 'G001']);
