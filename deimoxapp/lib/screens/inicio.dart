import 'package:deimoxapp/screens/clock_screen.dart';
import 'package:deimoxapp/screens/exer_cuerpo.dart';
import 'package:flutter/material.dart';
import 'package:deimoxapp/screens/home_screen.dart';
import 'package:deimoxapp/screens/profile_screen.dart';
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
                  height: 5,
                ),
                Image.asset('assets/images/logitipo22.png'),
                Container(
                  height: 650,
                  width: 350,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 24, 24, 24),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
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
                        height: 5,
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
                        height: 5,
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
                                  'assets/images/activas.png',
                                  'Activas',
                                  context,
                                ),
                              ),
                              const SizedBox(height: 5),
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
                                  'assets/images/cuerpo.png',
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
                                  'assets/images/pasivas.png',
                                  'Pasivas',
                                  context,
                                ),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ClockScreen(),
                                    ),
                                  );
                                },
                                child: _buildIconWithDescription(
                                  'assets/images/alarma.png',
                                  'Alarma',
                                  context,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
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
                              'assets/images/perfil.png',
                              'Perfil',
                              context,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Inicio(),
                                ),
                              );
                            },
                            child: _buildIconWithDescription(
                              'assets/images/exit.png',
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
            width: 120,
            height: 120,
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
