import 'package:deimoxapp/models/exercise.dart';
import 'package:deimoxapp/screens/signin_screen.dart';
import 'package:deimoxapp/screens/timer_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen3> {
  final List<Exercise> exercises = [
    Exercise(
        name: 'Flexiones',
        description:
            ' Comienza por colocarte boca abajo en el suelo, con las manos ligeramente más anchas que los hombros y los dedos apuntando hacia adelante o ligeramente hacia afuera. ',
        imagePath: "assets/images/flexiones.png"),
    Exercise(
        name: 'Plancha abdominal',
        description:
            'Para ejecutar este ejercicio debes comenzar por tumbarte boca abajo. Es importante que las caderas no toquen el suelo y que tus piernas permanezcan estiradas. Apoya sobre los antebrazos el tren superior.',
        imagePath: "assets/images/plancha2.png"),
    Exercise(
        name: 'Estocada hacia adelante',
        description:
            'Comienza de pie con los pies separados a la anchura de los hombros y los brazos a los lados del cuerpo.Baja lentamente el cuerpo hacia el suelo doblando ambas rodillas, manteniendo la espalda recta y el torso erguido. Desciende hasta que la rodilla de la pierna trasera casi toque el suelo.',
        imagePath: "assets/images/estocada.png"),
    Exercise(
        name: 'Abdominales',
        description:
            'Acuéstate boca arriba en una esterilla de ejercicio o en una superficie firme. Flexiona las rodillas y coloca los pies planos en el suelo, separados aproximadamente a la anchura de las caderas. Los brazos pueden estar cruzados sobre el pecho, detrás de la cabeza o extendidos a lo largo del cuerpo.',
        imagePath: "assets/images/abdominal.png"),
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
