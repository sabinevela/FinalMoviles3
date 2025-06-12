import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_taller/screens/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeIn;
  bool _isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeIn = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showAlert("Todos los campos son obligatorios.", isSuccess: false);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      setState(() {
        _isLoading = false;
      });

      _showAlert("Inicio de sesión exitoso ✅", isSuccess: true);
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
      });

      String mensaje = "Error al iniciar sesión.";
      if (e.code == 'user-not-found') {
        mensaje = "Usuario no encontrado.";
      } else if (e.code == 'wrong-password') {
        mensaje = "Contraseña incorrecta.";
      } else if (e.code == 'invalid-email') {
        mensaje = "Correo electrónico inválido.";
      }
      _showAlert(mensaje, isSuccess: false);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showAlert("Error inesperado: $e", isSuccess: false);
    }
  }

  void _showAlert(String message, {required bool isSuccess}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            isSuccess ? 'Éxito' : 'Error',
            style: const TextStyle(color: Colors.black),
          ),
          content: Text(
            message,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (isSuccess) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    ),
                  );
                }
              },
              child: const Text(
                'Aceptar',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Colors.black87; 
    const inputTextColor = Colors.white;

    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      backgroundColor: backgroundColor,
      body: FadeTransition(
        opacity: _fadeIn,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.lock_outline, size: 80, color: Colors.blueAccent),
              const SizedBox(height: 20),

              TextField(
                controller: emailController,
                style: const TextStyle(color: inputTextColor),
                cursorColor: inputTextColor,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(color: inputTextColor),
                  prefixIcon: Icon(Icons.email_outlined, color: inputTextColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              TextField(
                controller: passwordController,
                style: const TextStyle(color: inputTextColor),
                cursorColor: inputTextColor,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: inputTextColor),
                  prefixIcon: Icon(Icons.lock, color: inputTextColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                obscureText: true,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _isLoading ? null : _login,
                  icon: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.login),
                  label: Text(_isLoading ? 'Ingresando...' : 'Ingresar'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
