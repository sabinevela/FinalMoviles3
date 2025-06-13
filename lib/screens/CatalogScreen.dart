import 'package:app_taller/screens/VideoPlayerScreen.dart';
import 'package:flutter/material.dart';
import 'package:app_taller/models/movies.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String selectedGenre = 'Todos';

  @override
  Widget build(BuildContext context) {
    final genres = ['Todos', ...{...movies.map((m) => m.genre)}];
    final filteredMovies = selectedGenre == 'Todos'
        ? movies
        : movies.where((movie) => movie.genre == selectedGenre).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('🎬 Catálogo de Películas'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellowAccent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.yellowAccent),
              child: const Text(
                'Géneros',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ...genres.map((genre) => ListTile(
                  title: Text(
                    genre,
                    style: const TextStyle(color: Colors.yellowAccent),
                  ),
                  tileColor: genre == selectedGenre ? Colors.grey[850] : null,
                  onTap: () {
                    setState(() {
                      selectedGenre = genre;
                      Navigator.pop(context);
                    });
                  },
                )),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemCount: filteredMovies.length,
        itemBuilder: (context, index) {
          final movie = filteredMovies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoPlayerScreen(videoUrl: movie.videoUrl),
                ),
              );
            },
            child: Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.yellowAccent, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        movie.thumbnailUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      'Año: ${movie.year}',
                      style: const TextStyle(
                          color: Colors.yellowAccent, fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      movie.description,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 11),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



