import 'package:flutter/material.dart';

class ProfileDataScreen extends StatelessWidget {
  final String nombre;
  final int edad;
  final int peso;

  const ProfileDataScreen({super.key, required this.nombre, required this.edad, required this.peso});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nombre: $nombre',
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Edad: $edad años',
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Peso: $peso kg',
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}