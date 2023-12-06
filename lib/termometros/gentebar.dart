import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gatito_mimoso/constants.dart';
import 'package:gatito_mimoso/game_state.dart';

class GenteBar extends ConsumerWidget {
  const GenteBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 10,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(10),
              color: gente.color,
              value: ref.watch(valorProviders[gente]!),
              minHeight: 12,
            ),
          ),
          const Spacer(),
          const Icon(Icons.groups, size: 48),
        ],
      ),
    );
  }
}
