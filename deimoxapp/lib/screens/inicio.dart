import 'package:deimoxapp/screens/clock_screen.dart';
import 'package:deimoxapp/screens/exer_cuerpo.dart';
import 'package:flutter/material.dart';
import 'package:deimoxapp/screens/home_screen.dart';
import 'package:deimoxapp/screens/profile_screen.dart'; // Importa la pantalla que deseas abrir
import 'package:deimoxapp/screens/signin_screen.dart';
import 'package:deimoxapp/screens/exer_pasivos.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset('assets/images/logitipo22.png'),
                Container(
                  height: 650,
                  width: 325,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 24, 24, 24),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Pausas Activas',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Menú',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                },
                                child: _buildIconWithDescription(
                                  'assets/images/ejercicio.png',
                                  'Activas',
                                  context,
                                ),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen3(),
                                    ),
                                  );
                                },
                                child: _buildIconWithDescription(
                                  'assets/images/empresario.png',
                                  'Cuerpo',
                                  context,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen2(),
                                    ),
                                  );
                                },
                                child: _buildIconWithDescription(
                                  'assets/images/triangulo.png',
                                  'Pasivas',
                                  context,
                                ),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ClockScreen(), // Aquí se abre la pantalla de configuración de la alarma
                                    ),
                                  );
                                },
                                child: _buildIconWithDescription(
                                  'assets/images/tiempo.png',
                                  'Alarma',
                                  context,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Espacio adicional
                      // Agrega aquí las dos imágenes adicionales
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileScreen(),
                                ),
                              );
                            },
                            child: _buildIconWithDescription(
                              'assets/images/ajuste.png',
                              'Perfil',
                              context,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                            },
                            child: _buildIconWithDescription(
                              'assets/images/cerrar_sesion.png',
                              'Salir',
                              context,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithDescription(
    String imagePath,
    String description,
    BuildContext context,
  ) {
    return Container(
      margin: const EdgeInsets.all(8), // Margen alrededor del contenedor
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Borde redondeado
        border: Border.all(
            color: const Color.fromARGB(255, 113, 113, 113),
            width: 4), // Borde blanco
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 2), // Espacio entre la imagen y el texto
          Text(
            description,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
