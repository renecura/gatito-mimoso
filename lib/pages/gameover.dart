import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  const GameOver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Volver'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
