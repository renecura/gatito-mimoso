import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gatito_mimoso/constants.dart';
import 'package:gatito_mimoso/game_state.dart';

class GameOver extends ConsumerWidget {
  const GameOver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final causa = ref.watch(statusProvider);
    debugPrint("Causa del gameover: $causa");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(48),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('GAME OVER'),
              SizedBox(
                  height: 256,
                  child: Image.asset('assets/images/gatito/gatito07.png')),
              Text(causas[causa]!),
              ElevatedButton(
                  child: const Text('Volver'),
                  onPressed: () {
                    resetGame(ref);
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
