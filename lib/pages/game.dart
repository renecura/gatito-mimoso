import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gatito_mimoso/models/patron_model.dart';
import 'package:gatito_mimoso/termometros/gentebar.dart';

import '../card.dart';
import '../constants.dart';
import '../dialogs/clona_dialog.dart';
import '../game_state.dart';
import '../models/card_model.dart';
import '../termometros/patronbar.dart';

const maxAnsiedad = 6;

class Game extends ConsumerWidget {
  final CardSwiperController controller = CardSwiperController();

  Game({super.key});

  aceptar() => controller.swipeRight();
  rechazar() => controller.swipeLeft();
  postergar() => controller.swipeTop();

  gameOver(Status status, WidgetRef ref) {
    ref.read(statusProvider.notifier).state = status;
  }

  agregarCarta(String code, WidgetRef ref) {
    ref.read(deckProvider.notifier).update((state) => [...state, code]);
  }

  modificarValor(PatronModel patron, double delta, WidgetRef ref) {
    ref.read(valorProviders[patron]!.notifier).update((state) {
      state = min(1.0, state + delta);

      if (state <= 0) {
        gameOver(patron.status, ref);
      }

      return state;
    });
  }

  modificarAnsiedad(int delta, WidgetRef ref) {
    ref.read(ansiedadProvider.notifier).update((state) {
      debugPrint('Ansiedad: $state + $delta');

      state += delta;

      if (state >= maxAnsiedad) {
        gameOver(Status.psicotico, ref);
      }

      if (state >= maxAnsiedad) return maxAnsiedad;
      if (state <= 1) return 1;

      return state;
    });
  }

  meterseClona(WidgetRef ref) {
    modificarAnsiedad(-3, ref);
    ref.read(clonasProvider.notifier).state--;
  }

  AccionCarta swipeToAction(CardSwiperDirection direction) {
    switch (direction) {
      case CardSwiperDirection.left:
        return AccionCarta.rechazar;
      case CardSwiperDirection.right:
        return AccionCarta.aceptar;
      case CardSwiperDirection.top:
        return AccionCarta.postergar;
      default:
        return AccionCarta.nada;
    }
  }

  resolverCarta(String code, AccionCarta accion, WidgetRef ref) {
    RegExp exp = RegExp(r'(?<Op>[\+\-\@])(?<Arg>\w+),*');

    String cons = cartas[code]?.consecuencias(accion) ?? '';

    for (final m in exp.allMatches(cons)) {
      String op = m.namedGroup("Op")!;
      String arg = m.namedGroup("Arg")!;
      debugPrint("OP: $op Arg: $arg");

      switch (op) {
        case "+":
          if (arg == 'A') {
            modificarAnsiedad(1, ref);
            break;
          }
          modificarValor(patron(arg), 0.1, ref);
          break;
        case "-":
          if (arg == 'A') {
            modificarAnsiedad(-1, ref);
            break;
          }
          modificarValor(patron(arg), -0.1, ref);
          break;
        case "@":
          agregarCarta(arg, ref);
          break;
        default:
          debugPrint("Consecuencia desconocida.");
      }
    }
  }

  bool _onSwipe(
    WidgetRef ref,
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint("El index: $previousIndex");
    resolverCarta(
      ref.watch(deckProvider)[previousIndex],
      swipeToAction(direction),
      ref,
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(statusProvider);

    if (status != Status.ok) {
      debugPrint("Game over: $status");
      Future.delayed(Durations.short1, () {
        Navigator.popAndPushNamed(context, '/gameover');
      });
    }

    Widget patrones = Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PatronBar(patron: casta),
          PatronBar(patron: fuerzas),
          PatronBar(patron: establishment),
        ],
      ),
    );

    List<String> deck = ref.watch(deckProvider);
    debugPrint("Rebuild swiper: ${deck.toString()}");

    CardSwiper swiper = CardSwiper(
      controller: controller,
      cardsCount: deck.length,
      onSwipe: (prev, curr, dir) => _onSwipe(ref, prev, curr, dir),
      onUndo: _onUndo,
      numberOfCardsDisplayed: 3,
      backCardOffset: const Offset(0, -40),
      padding: const EdgeInsets.all(24.0),
      isLoop: false,
      allowedSwipeDirection: const AllowedSwipeDirection.none(),
      cardBuilder: (
        context,
        index,
        horizontalThresholdPercentage,
        verticalThresholdPercentage,
      ) =>
          CardWidget(code: deck[index], game: this),
    );

    final genteBar = GenteBar();

    final ansiedad = ref.watch(ansiedadProvider);

    return Scaffold(
      backgroundColor: Color.fromRGBO(155, 229, 244, 1),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            patrones,
            genteBar,
            const Spacer(flex: 2),
            Flexible(flex: 20, child: swiper),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                height: 150,
                alignment: Alignment.centerRight,
                child: Image.asset('assets/images/gatito/gatito0$ansiedad.png'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        height: 40,
      ),
      floatingActionButton: Badge.count(
        count: ref.watch(clonasProvider),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: ref.watch(clonasProvider) <= 0
              ? null
              : () => showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) =>
                        ClonaDialog(accion: () => meterseClona(ref)),
                  ),
          tooltip: '¡Power ups!',
          child: const Icon(Icons.pets),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
