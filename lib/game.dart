import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'card.dart';
import 'constants.dart';
import 'models/card_model.dart';

final valorCasta = StateProvider<double>((ref) => 0.5);
final valorFuerzas = StateProvider<double>((ref) => 0.5);
final valorEstablishment = StateProvider<double>((ref) => 0.5);
final valorGente = StateProvider<double>((ref) => 0.5);

final deck =
    StateProvider<List<String>>((ref) => ['C001', 'E001', 'F001', 'G001']);

final valores = {
  'C': valorCasta,
  'F': valorFuerzas,
  'E': valorEstablishment,
  'G': valorGente,
};

class Game extends ConsumerWidget {
  final CardSwiperController controller = CardSwiperController();

  Game({super.key});

  aceptar() => controller.swipeRight();
  rechazar() => controller.swipeLeft();
  postergar() => controller.swipeTop();

  agregarCarta(String code, WidgetRef ref) {
    ref.read(deck.notifier).state.add(code);
  }

  modificarValor(String target, double delta, WidgetRef ref) {
    ref.read(valores[target]!.notifier).state += delta;
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
          modificarValor(arg, 0.1, ref);
          break;
        case "-":
          modificarValor(arg, -0.1, ref);
          break;
        case "@":
          agregarCarta(arg, ref);
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
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    resolverCarta(
      ref.watch(deck)[previousIndex],
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
    Widget patrones = Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PatronBar(index: casta, value: ref.watch(valorCasta)),
          PatronBar(index: fuerzas, value: ref.watch(valorFuerzas)),
          PatronBar(index: establishment, value: ref.watch(valorEstablishment)),
        ],
      ),
    );

    Widget pueblo = Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 10,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(10),
              color: patronColors[gente],
              value: ref.watch(valorGente),
              minHeight: 12,
            ),
          ),
          const Spacer(),
          const Icon(Icons.groups, size: 48),
        ],
      ),
    );

    CardSwiper swiper = CardSwiper(
      controller: controller,
      cardsCount: ref.watch(deck).length,
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
          CardWidget(code: ref.watch(deck)[index], game: this),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            patrones,
            pueblo,
            const Spacer(flex: 2),
            Flexible(flex: 20, child: swiper),
            Container(height: 150),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton.large(
        shape: const CircleBorder(),
        onPressed: () {
          debugPrint("Miau!");
          controller.swipeLeft();
        },
        tooltip: '¡Power ups!',
        child: const Icon(Icons.pets),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class PatronBar extends StatelessWidget {
  final int index;
  final double value;

  const PatronBar({
    super.key,
    required this.index,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(patronIcons[index], size: 48),
        CircularProgressIndicator(
          strokeWidth: 12,
          strokeAlign: 4.5,
          strokeCap: StrokeCap.round,
          color: patronColors[index],
          backgroundColor: patronColors[index].withOpacity(0.2),
          value: value,
        ),
      ],
    );
  }
}
