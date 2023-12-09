import 'package:flutter/material.dart';

class ClonaDialog extends StatelessWidget {
  final VoidCallback accion;

  const ClonaDialog({super.key, required this.accion});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 24,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/gatito/gatito06.png'),
          Image.asset('assets/images/clonazelcan.png'),
          const Text(
              "Madura el brote psicótico. Empastillate un toque para bajar la ansiedad"),
          const Text("(reduce hasta 3 niveles)"),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Nah"),
          onPressed: () => Navigator.pop(context, 'Cancel'),
        ),
        TextButton(
          child: const Text("¡Atroden!"),
          onPressed: () {
            accion();
            Navigator.pop(context, 'OK');
          },
        ),
      ],
    );
  }
}
