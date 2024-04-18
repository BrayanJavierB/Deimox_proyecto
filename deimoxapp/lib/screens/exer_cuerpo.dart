import 'package:deimoxapp/models/exercise.dart';
import 'package:deimoxapp/screens/signin_screen.dart';
import 'package:deimoxapp/screens/timer_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State <HomeScreen3> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen3> {
  final List<Exercise> exercises = [
    Exercise(
        name: 'Flexiones de pecho',
        description: 'Descripción...',
        imagePath: "assets/images/xd.png"),
    Exercise(
        name: 'Sentadilla',
        description: 'Descripción...',
        imagePath: "assets/images/xd.png"),
    Exercise(
        name: 'Skipping',
        description: 'Trotar sin moverse',
        imagePath: "assets/images/xd.png"),
    Exercise(
        name: 'Abdominales',
        description: 'Descripción...',
        imagePath: "assets/images/xd.png"),
    // Agregar más ejercicios según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ejercicios de Pausas de Cuerpo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              });
            },
          ),
        ],
        iconTheme: const IconThemeData(
          color:
              Colors.white, // Cambia el color de la flecha de devolver a blanco
          size: 30, // Aumenta el tamaño para hacerla más prominente
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Image.asset(
                    exercises[index].imagePath,
                    width: 60,
                    height: 60,
                  ),
                  title: Text(
                    exercises[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      exercises[index].description,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimerScreen(
                          exercises: exercises,
                          exerciseIndex: index,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
