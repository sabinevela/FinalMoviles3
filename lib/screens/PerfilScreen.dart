import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final user = FirebaseAuth.instance.currentUser;
  File? _imagen;
  String? _pathGuardado;
  Map<String, dynamic>? datosUsuario;

  @override
  void initState() {
    super.initState();
    _cargarImagenGuardada();
    _cargarDatosUsuario();
  }

  Future<void> _cargarImagenGuardada() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('avatar_${user!.uid}');
    if (path != null && File(path).existsSync()) {
      setState(() {
        _pathGuardado = path;
        _imagen = File(path);
      });
    }
  }

  Future<void> _cargarDatosUsuario() async {
    final dbRef = FirebaseDatabase.instance.ref('users/${user!.uid}');
    final snapshot = await dbRef.get();
    if (snapshot.exists) {
      final data = Map<String, dynamic>.from(snapshot.value as Map);
      setState(() {
        datosUsuario = data;
      });
    }
  }

  Future<void> _seleccionarImagen(ImageSource source) async {
    final XFile? seleccionada = await ImagePicker().pickImage(source: source);
    if (seleccionada != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('avatar_${user!.uid}', seleccionada.path);
      setState(() {
        _imagen = File(seleccionada.path);
        _pathGuardado = seleccionada.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatarImage = _imagen != null
        ? FileImage(_imagen!)
        : const AssetImage('assets/images/Avatar.png') as ImageProvider;

    final nombreUsuario = datosUsuario?['username'] ?? '';
    final nombreCompleto =
        '${datosUsuario?['nombre1'] ?? ''} ${datosUsuario?['nombre2'] ?? ''} ${datosUsuario?['apellido1'] ?? ''} ${datosUsuario?['apellido2'] ?? ''}';
    final edad = datosUsuario?['edad']?.toString() ?? '';
    final correo = user?.email ?? 'Correo no disponible';

    return Scaffold(
      appBar: AppBar(title: const Text('Mi Perfil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Bienvenido, $nombreUsuario',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: avatarImage,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _seleccionarImagen(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library),
                  label: const Text("Galería"),
                ),
                const SizedBox(width: 16),
                OutlinedButton.icon(
                  onPressed: () => _seleccionarImagen(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Cámara"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nombre completo: $nombreCompleto'),
                    const SizedBox(height: 8),
                    Text('Edad: $edad'),
                    const SizedBox(height: 8),
                    Text('Correo: $correo'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
