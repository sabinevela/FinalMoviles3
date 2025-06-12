import 'package:app_taller/auth/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final nombre1Controller = TextEditingController();
  final nombre2Controller = TextEditingController();
  final apellido1Controller = TextEditingController();
  final apellido2Controller = TextEditingController();
  final edadController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmarPasswordController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeIn;

  bool _loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('users');

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _fadeIn =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    nombre1Controller.dispose();
    nombre2Controller.dispose();
    apellido1Controller.dispose();
    apellido2Controller.dispose();
    edadController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmarPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      final uid = userCredential.user!.uid;

      await _dbRef.child(uid).set({
        'nombre1': nombre1Controller.text.trim(),
        'nombre2': nombre2Controller.text.trim(),
        'apellido1': apellido1Controller.text.trim(),
        'apellido2': apellido2Controller.text.trim(),
        'edad': int.parse(edadController.text.trim()),
        'username': usernameController.text.trim(),
        'email': emailController.text.trim(),
      });

      _showAlert("¡Registro exitoso!",
          "Usuario registrado correctamente ✅", true);
    } on FirebaseAuthException catch (e) {
      String errorMsg = "Ocurrió un error, intenta de nuevo.";
      if (e.code == 'email-already-in-use') {
        errorMsg = "El correo ya está registrado.";
      } else if (e.code == 'weak-password') {
        errorMsg = "La contraseña es muy débil.";
      }
      _showAlert("Error", errorMsg, false);
    } catch (e) {
      _showAlert("Error", "Ocurrió un error, intenta de nuevo.", false);
    } finally {
      setState(() => _loading = false);
    }
  }

  void _showAlert(String title, String message, bool success) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(success ? Icons.check_circle : Icons.error,
                color: success ? Colors.green : Colors.red),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        content: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            child: const Text(
              "Aceptar",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.pop(context);
              if (success) {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  String? _validateText(String? val, String fieldName, {int? minLen}) {
    if (val == null || val.trim().isEmpty) {
      return "El campo $fieldName es obligatorio.";
    }
    if (minLen != null && val.trim().length < minLen) {
      return "$fieldName debe tener al menos $minLen caracteres.";
    }
    return null;
  }

  String? _validateEdad(String? val) {
    if (val == null || val.trim().isEmpty) {
      return "El campo Edad es obligatorio.";
    }
    int? edad = int.tryParse(val.trim());
    if (edad == null || edad < 1 || edad > 120) {
      return "Ingrese una edad válida entre 1 y 120.";
    }
    return null;
  }

  String? _validateConfirmPassword(String? val) {
    if (val == null || val.isEmpty) {
      return "Debe confirmar la contraseña.";
    }
    if (val != passwordController.text) {
      return "Las contraseñas no coinciden.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final dorado = const Color(0xFFFFD700);

    Widget _buildTwoFields(TextEditingController c1, String label1, IconData icon1,
        TextEditingController c2, String label2, IconData icon2,
        {bool obscure1 = false, bool obscure2 = false,
        String? Function(String?)? validator1,
        String? Function(String?)? validator2}) {
      return Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextFormField(
                controller: c1,
                obscureText: obscure1,
                style: const TextStyle(color: Colors.white), // TEXTO BLANCO
                decoration: InputDecoration(
                  labelText: label1,
                  prefixIcon: Icon(icon1, color: dorado),
                  border: const OutlineInputBorder(),
                ),
                validator: validator1,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextFormField(
                controller: c2,
                obscureText: obscure2,
                style: const TextStyle(color: Colors.white), // TEXTO BLANCO
                decoration: InputDecoration(
                  labelText: label2,
                  prefixIcon: Icon(icon2, color: dorado),
                  border: const OutlineInputBorder(),
                ),
                validator: validator2,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: FadeTransition(
        opacity: _fadeIn,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Icon(Icons.person_add_alt_1, size: 80, color: dorado),
                const SizedBox(height: 20),
                _buildTwoFields(
                  nombre1Controller,
                  'Primer Nombre',
                  Icons.person_outline,
                  nombre2Controller,
                  'Segundo Nombre',
                  Icons.person_outline,
                  validator1: (val) => _validateText(val, "Primer Nombre", minLen: 2),
                  validator2: (val) => _validateText(val, "Segundo Nombre", minLen: 2),
                ),
                const SizedBox(height: 16),
                _buildTwoFields(
                  apellido1Controller,
                  'Primer Apellido',
                  Icons.person_outline,
                  apellido2Controller,
                  'Segundo Apellido',
                  Icons.person_outline,
                  validator1: (val) => _validateText(val, "Primer Apellido", minLen: 2),
                  validator2: (val) => _validateText(val, "Segundo Apellido", minLen: 2),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: edadController,
                  style: const TextStyle(color: Colors.white), // TEXTO BLANCO
                  decoration: InputDecoration(
                    labelText: 'Edad',
                    prefixIcon: Icon(Icons.cake_outlined, color: dorado),
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: _validateEdad,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: usernameController,
                  style: const TextStyle(color: Colors.white), // TEXTO BLANCO
                  decoration: InputDecoration(
                    labelText: 'Nombre de usuario',
                    prefixIcon: Icon(Icons.account_circle_outlined, color: dorado),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) => _validateText(val, "Nombre de usuario", minLen: 3),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white), // TEXTO BLANCO
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    prefixIcon: Icon(Icons.email_outlined, color: dorado),
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return "El correo es obligatorio.";
                    }
                    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                        .hasMatch(val.trim())) {
                      return "Ingrese un correo válido.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTwoFields(
                  passwordController,
                  'Contraseña',
                  Icons.lock_outline,
                  confirmarPasswordController,
                  'Confirmar Contraseña',
                  Icons.lock_outline,
                  obscure1: true,
                  obscure2: true,
                  validator1: (val) {
                    if (val == null || val.isEmpty) {
                      return "La contraseña es obligatoria.";
                    }
                    if (val.length < 6) {
                      return "La contraseña debe tener al menos 6 caracteres.";
                    }
                    return null;
                  },
                  validator2: _validateConfirmPassword,
                ),
                const SizedBox(height: 30),

                _loading
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.amber))
                    : ElevatedButton.icon(
                        onPressed: _register,
                        icon: const Icon(Icons.app_registration),
                        label: const Text('Registrar'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: dorado,
                          foregroundColor: Colors.black,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
