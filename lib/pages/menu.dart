import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Iniciar'),
          onPressed: () {
            Navigator.pushNamed(context, '/game');
          },
        ),
      ),
    );
  }
}
