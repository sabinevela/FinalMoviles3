import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          width: 300,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.movie, size: 60, color: Colors.blueAccent),
              SizedBox(height: 10),
              Text('Película destacada', style: TextStyle(fontSize: 20)),
              Text('Acción - 2025'),
            ],
          ),
        ),
      ),
    );
  }
}
