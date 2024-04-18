import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'inicio.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:image_picker/image_picker.dart'; // Importa image_picker
//import 'package:file_selector/file_selector.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State <ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _profileImage = "assets/images/xd.png";
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Colors.white, // Color del texto
            fontWeight: FontWeight.bold, // Negrita
          ),
        ),
        backgroundColor: Colors.black, // Fondo negro del AppBar
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // Color de la flecha de retroceso y otros iconos del AppBar
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.3,
                  backgroundImage: AssetImage(_profileImage),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _edadController,
                decoration: const InputDecoration(
                  labelText: 'Edad',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              TextFormField(
                controller: _pesoController,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _seleccionarImagen(); // Llama a la función para seleccionar imagen
                    },
                    icon: const Icon(Icons.photo_camera),
                    color: Colors.white,
                    iconSize: 30.0,
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      _guardarDatosEnFirestore(
                          _nombreController.text,
                          int.parse(_edadController.text),
                          int.parse(_pesoController.text));
                    },
                    child: const Text('Guardar Datos'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Inicio()),
                  );
                },
                child: const Text('Volver a Inicio'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función para seleccionar imagen de la galería
 Future<void> _seleccionarImagen() async {
  // Aquí defines una lista de nombres de archivos de imagen que se encuentran en assets/images
  final List<String> imagenes = [
    'assets/images/xd.png',
    'assets/images/ayuda.jpg',
    // Añade más imágenes según sea necesario
  ];

  final String? imagenSeleccionada = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Selecciona una imagen'),
        content: SingleChildScrollView(
          child: ListBody(
            children: imagenes.map((String imagen) {
              return ListTile(
                title: Text(imagen),
                onTap: () {
                  Navigator.of(context).pop(imagen);
                },
              );
            }).toList(),
          ),
        ),
      );
    },
  );

  
  if (imagenSeleccionada != null) {
    setState(() {
      _profileImage = imagenSeleccionada;
    });
  }
}


  void _guardarDatosEnFirestore(String nombre, int edad, int peso) {
    final firestore = FirebaseFirestore.instance;
    firestore.collection('perfiles').add({
      'nombre': nombre,
      'edad': edad,
      'peso': peso,
      'imagen': _profileImage, // Guarda la URL de la imagen
    }).then((value) {
      debugPrint('Datos guardados en Firestore con ID: ${value.id}');
      // Navegar a la pantalla de perfil de datos
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileDataScreen(nombre: nombre, edad: edad, peso: peso),
        ),
      );
    }).catchError((error) {
      debugPrint('Error al guardar los datos: $error');
      // Muestra un diálogo de error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Hubo un error al guardar los datos.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }
}

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
