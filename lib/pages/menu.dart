import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(144, 219, 227, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/your_image.png',
              height: 100,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(55, 105, 222, 100),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(20.0),
              ),
              onPressed: () {
                // Lógica para el primer botón (por ejemplo, iniciar juego)
                Navigator.pushNamed(context, '/game');
              },
              child: const Text('Jugar', style: TextStyle(fontSize: 18.0)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(55, 105, 222, 100),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(20.0),
              ),
              onPressed: () {
                // Lógica para el segundo botón (por ejemplo, mostrar tutorial)
              },
              child: const Text('Tutorial', style: TextStyle(fontSize: 18.0)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(55, 105, 222, 100),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(20.0),
              ),
              onPressed: () {
                // Lógica para el tercer botón (por ejemplo, mostrar créditos)
              },
              child: const Text('Créditos', style: TextStyle(fontSize: 18.0)),
            ),
          ],
        ),
      ),
    );
  }
}
