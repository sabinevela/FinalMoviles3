import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.ondemand_video, size: 100, color: Colors.redAccent),
          SizedBox(height: 20),
          Text('Reproductor de Películas', style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}