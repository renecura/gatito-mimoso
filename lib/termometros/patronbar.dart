import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gatito_mimoso/game_state.dart';

import '../models/patron_model.dart';

class PatronBar extends ConsumerWidget {
  final PatronModel patron;

  const PatronBar({
    super.key,
    required this.patron,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (patron.icon != null)
          Icon(
            patron.icon,
            size: 100,
          )
        else if (patron.imagePath != null)
          Image.asset(
            patron.imagePath!,
            width: 100,
            height: 100,
          ),
        CircularProgressIndicator(
          strokeWidth: 12,
          strokeAlign: 4.5,
          strokeCap: StrokeCap.round,
          color: patron.color,
          backgroundColor: patron.color.withOpacity(0.2),
          value: ref.watch(valorProviders[patron]!),
        ),
      ],
    );
  }
}
