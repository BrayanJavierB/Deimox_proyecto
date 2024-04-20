import 'package:deimoxapp/models/exercise.dart';
import 'package:deimoxapp/screens/signin_screen.dart';
import 'package:deimoxapp/screens/timer_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Exercise> exercises = [
    Exercise(
        name: 'Sentadillas',
        description:
            "De pie, separe sus pies a la anchura de los hombros y ponga los dedos de los pies ligeramente hacia fuera. Sus manos deben estar a cada lado de la caderas. Mantenga la espalda bién posicionada.",
        imagePath: "assets/images/sentadilla.png"),
    Exercise(
        name: 'Estiramiento para trapecio superior',
        description:
            'Párese derecho con los pies a la anchura de los hombros. Tome el lado izquierdo de su cabeza con la mano derecha. Mantenga la columna vertebral recta.',
        imagePath: "assets/images/estirar-trapecio.png"),
    Exercise(
        name: 'Estiramiento paravertebrales y dorsales',
        description:
            'Colóquese de pie con los pies a la anchura de los hombros. Coloque sus manos justo encima de usted con los dedos entrelazados. Los brazos deben estar rectos y las palmas deben apuntar hacia el techo.',
        imagePath: "assets/images/estirar-vertebras2.png"),
    Exercise(
        name: 'Estiramiento de tríceps detrás de la cabeza',
        description:
            'Colóquese de pie con los pies a la anchura de los hombros. Coloque su brazo derecho detrás de su cabeza y agárrelo del codo con su mano izquierda.',
        imagePath: "assets/images/estirar-tricepts.png"),
    // Agregar más ejercicios según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ejercicios de Pausas Activas',
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
