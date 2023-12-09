import 'package:flutter/material.dart';

class CreditosPage extends StatelessWidget {
  const CreditosPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 224, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            const Text('Desarrollado por:', style: TextStyle(fontSize: 20.0)),
            const Text('Rodrigo Rene Cura y Ariel Andres',
                style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 100),
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
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Volver al menú',
                  style: TextStyle(fontSize: 18.0)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
