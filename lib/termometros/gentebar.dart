import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gatito_mimoso/constants.dart';
import 'package:gatito_mimoso/game_state.dart';

class GenteBar extends ConsumerWidget {
  final GlobalKey<TooltipState> reaccionKey = GlobalKey<TooltipState>();
  final mensajes = [
    '¡Viva la libertad CARAJO!',
    '¡Se van!',
    '¡Mi presidente!',
    '¡Tiemblen zurrrdos!',
    'Y.. la pesada herencia',
    "LO' DOLARE'",
    'Lloren, lloren',
    'Ahora van a tener que laburar',
    'Yo igual me tengo que levantar a trabajar',
  ];

  GenteBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("Ahi viene el mensaje");
    Future.delayed(Durations.short1)
        .then((value) => reaccionKey.currentState?.ensureTooltipVisible());

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Tooltip(
            key: reaccionKey,
            triggerMode: TooltipTriggerMode.manual,
            showDuration: Durations.short1,
            message: mensajes[Random().nextInt(mensajes.length)],
            preferBelow: false,
            child: const Icon(Icons.groups, size: 48),
          ),
          const Spacer(),
          Flexible(
            flex: 10,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(10),
              color: gente.color,
              value: ref.watch(valorProviders[gente]!),
              minHeight: 12,
            ),
          ),
        ],
      ),
    );
  }
}
