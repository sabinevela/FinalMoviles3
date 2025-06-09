import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        'title': 'Misión Imposible',
        'genre': 'Acción',
        'image': 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
      },
      {
        'title': 'Son Como Niños',
        'genre': 'Comedia',
        'image': 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/fAD2H7dgXh3sRo2zUdavLqCE10U.jpg',
      },
      {
        'title': 'El Pianista',
        'genre': 'Drama',
        'image': 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/2hR4v4FDKHzBflhSIWYO6gqVhCX.jpg',
      },
      {
        'title': 'El Conjuro',
        'genre': 'Terror',
        'image': 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wmSKfD1wVn3d6EVUD5W2Cke5Hxy.jpg',
      },
      {
        'title': 'This Is Us',
        'genre': 'Documental • One Direction',
        'image': 'https://m.media-amazon.com/images/I/81zFvTT9XkL._AC_UF894,1000_QL80_.jpg',
      },
      {
        'title': '5 Seconds of Summer: So Perfect',
        'genre': 'Documental • 5SOS',
        'image': 'https://m.media-amazon.com/images/I/71q8-3K2uqL._AC_UF894,1000_QL80_.jpg',
      },
      {
        'title': 'Avengers: Endgame',
        'genre': 'Acción • Aventura',
        'image': 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
      },
      {
        'title': 'La La Land',
        'genre': 'Musical • Romance',
        'image': 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg',
      },
      {
        'title': 'Smile',
        'genre': 'Terror • Psicológico',
        'image': 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/aPqcQwu4VGEewPhagWNncDbJ9Xp.jpg',
      },
      {
        'title': 'Intensamente',
        'genre': 'Animación • Familiar',
        'image': 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/lRHE0vzf3oYJrhbsHXjIkF4Tl5A.jpg',
      },
      {
        'title': 'Barbie',
        'genre': 'Fantasía • Comedia',
        'image': 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg',
      },
      {
        'title': 'Elvis',
        'genre': 'Biografía • Música',
        'image': 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qBOKWqAFbveZ4ryjJJwbie6tXkQ.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Películas'),
        backgroundColor: Colors.redAccent,
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
                  color: Colors.white,
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
