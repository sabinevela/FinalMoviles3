import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        'title': 'Misión Imposible',
        'genre': 'Acción',
        'image':
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
      },
      {
        'title': 'Son Como Niños',
        'genre': 'Comedia',
        'image':
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/fAD2H7dgXh3sRo2zUdavLqCE10U.jpg',
      },
      {
        'title': 'El Pianista',
        'genre': 'Drama',
        'image':
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/2hR4v4FDKHzBflhSIWYO6gqVhCX.jpg',
      },
      {
        'title': 'El Conjuro',
        'genre': 'Terror',
        'image':
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wmSKfD1wVn3d6EVUD5W2Cke5Hxy.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('🎬 Catálogo de Películas'),
        backgroundColor: Colors.redAccent.shade700,
        elevation: 10,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.6, 
        ),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: Colors.grey[900],
                  title: Text(
                    movie['title']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  content: Text(
                    'Género: ${movie['genre']}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Cerrar', style: TextStyle(color: Colors.redAccent)),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      movie['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  movie['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  movie['genre']!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
