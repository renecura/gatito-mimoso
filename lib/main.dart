import 'package:gatito_mimoso/pages/game.dart';
import 'package:gatito_mimoso/pages/gameover.dart';
import 'package:gatito_mimoso/pages/menu.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Menu(),
          '/game': (context) => Game(),
          '/gameover': (context) => const GameOver(),
        },
      ),
    ),
  );
}
