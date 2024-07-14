
import 'package:autenticacion/screens/closing_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String userEmail;

  const HomePage({Key? key, required this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String avatarImagePath = userEmail == 'ccarcamod@unah.hn'
        ? 'assets/images/6.jpg'
        : 'assets/images/5.jpg';

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 54, 171),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Bienvenido de vuelta, Ing',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
color: Color.fromARGB(255, 33, 54, 171),
        ),
      ),
      Text(
        userEmail,
        style: TextStyle(
          fontSize: 14.0,
          color: Color.fromARGB(255, 33, 54, 171),
        ),
      ),
    ],
  ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text(
                      '¿Está seguro de que desea cerrar la sesión?',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Cerrar el diálogo
                        },
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 54, 171),
                          ),
                        ), // Cambiado de "No" a "Cancelar"
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Cerrar el diálogo
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ClosingScreen()),
                            (route) =>
                                false, // Cerrar todas las pantallas anteriores
                          );
                        },
                        child: const Text(
                          'Cerrar sesión',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                   color: Color.fromARGB(255, 33, 54, 171),
                          ),
                        ), // Cambiado de "Sí" a "Cerrar sesión"
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(avatarImagePath),
                radius: 25.0,
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '¡Bienvenido!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Es un placer tenerte aquí',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePage(userEmail: ''),
  ));
}
