import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants.dart';

final valorProviders = {
  gente: StateProvider<double>((ref) => 0.5),
  casta: StateProvider<double>((ref) => 0.5),
  fuerzas: StateProvider<double>((ref) => 0.5),
  establishment: StateProvider<double>((ref) => 0.5),
};

final ansiedadProvider = StateProvider<int>((ref) => 2);
final clonasProvider = StateProvider<int>((ref) => 7);

final deckProvider =
    StateProvider<List<String>>((ref) => ['C001', 'E001', 'F001', 'G001']);

enum Status { ok, psicotico, casta, fuerzas, establishment, gente }

final statusProvider = StateProvider<Status>((ref) => Status.ok);

void resetGame(WidgetRef ref) {
  valorProviders.values.forEach(ref.invalidate);
  ref.invalidate(deckProvider);
  ref.invalidate(clonasProvider);
  ref.invalidate(ansiedadProvider);
  ref.invalidate(statusProvider);
}
