import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        'title': 'Misión Imposible',
        'genre': 'Acción',
        'image': 'https://m.media-amazon.com/images/M/MV5BMjQ3MzNlOTEtNGU5ZS00ODI0LTgxNDctMjA4MTUxMjY4NTU0XkEyXkFqcGc@._V1_.jpg',
      },
      {
        'title': 'Son Como Niños',
        'genre': 'Comedia',
        'image': 'https://m.media-amazon.com/images/M/MV5BMDJmYWI5NDctZjM5Zi00NzJiLTk4YTEtZjFhYTZhMTJiYWEzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
      },
      {
        'title': 'El Pianista',
        'genre': 'Drama',
        'image': 'https://upload.wikimedia.org/wikipedia/en/a/a6/The_Pianist_movie.jpg',
      },
      {
        'title': 'El Conjuro',
        'genre': 'Terror',
        'image': 'https://play-lh.googleusercontent.com/qJYOlnHj3UfvgwogydoxgyvjgHpLYIxNF24ihwPLOZWxEQCZhAan9pTE-6t3zysibmDl2k_udhEY_-muh3Nk',
      },
      {
        'title': 'This Is Us',
        'genre': 'Documental • One Direction',
        'image': 'https://m.media-amazon.com/images/I/81NpabfCP3L.jpg',
      },
      {
        'title': '5 Seconds of Summer',
        'genre': 'Documental • 5SOS',
        'image': 'https://m.media-amazon.com/images/M/MV5BZWU4YjZkNTQtNGQ4ZC00YmRhLThjYzEtZTIzNTliODZiYjBjXkEyXkFqcGc@._V1_.jpg',
      },
      {
        'title': 'Avengers: Endgame',
        'genre': 'Acción • Aventura',
        'image': 'https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg',
      },
      {
        'title': 'La La Land',
        'genre': 'Musical • Romance',
        'image': 'https://upload.wikimedia.org/wikipedia/en/a/ab/La_La_Land_%28film%29.png',
      },
      {
        'title': 'Smile',
        'genre': 'Terror • Psicológico',
        'image': 'https://upload.wikimedia.org/wikipedia/en/e/e7/Smile_2022_film_poster.png',
      },
      {
        'title': 'Intensamente',
        'genre': 'Animación • Familiar',
        'image': 'https://upload.wikimedia.org/wikipedia/en/0/0a/Inside_Out_%282015_film%29_poster.jpg',
      },
      {
        'title': 'Barbie',
        'genre': 'Fantasía • Comedia',
        'image': 'https://upload.wikimedia.org/wikipedia/en/0/0b/Barbie_2023_poster.jpg',
      },
      {
        'title': 'Elvis',
        'genre': 'Biografía • Música',
        'image': 'https://upload.wikimedia.org/wikipedia/en/e/e8/Elvis_2022_film_poster.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Películas'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 251, 251),
              ),
              child: Text(
                'Catálogos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Películas'),
            ),
            ListTile(
              leading: Icon(Icons.music_video),
              title: Text('Documentales musicales'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Favoritas'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
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
                  backgroundColor: Colors.white,
                  title: Text(
                    movie['title']!,
                    style: const TextStyle(color: Colors.black),
                  ),
                  content: Text(
                    'Género: ${movie['genre']}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Cerrar', style: TextStyle(color: Colors.blueAccent)),
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
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  movie['title']!,
                  style: const TextStyle(
                    color: Colors.black,
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
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
