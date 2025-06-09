import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Movie {
  final String title;
  final String genre;
  final String videoUrl;
  final String imageUrl;

  Movie({
    required this.title,
    required this.genre,
    required this.videoUrl,
    required this.imageUrl,
  });
}

final List<Movie> allMovies = [
  Movie(
    title: 'Misión Imposible',
    genre: 'Acción',
    videoUrl:
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    imageUrl:
        'https://m.media-amazon.com/images/M/MV5BMjQ3MzNlOTEtNGU5ZS00ODI0LTgxNDctMjA4MTUxMjY4NTU0XkEyXkFqcGc@._V1_.jpg',
  ),
  Movie(
    title: 'Son Como Niños',
    genre: 'Comedia',
    videoUrl:
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    imageUrl:
        'https://m.media-amazon.com/images/M/MV5BMDJmYWI5NDctZjM5Zi00NzJiLTk4YTEtZjFhYTZhMTJiYWEzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
  ),
  Movie(
    title: 'El Pianista',
    genre: 'Drama',
    videoUrl:
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/a/a6/The_Pianist_movie.jpg',
  ),
  Movie(
    title: 'El Conjuro',
    genre: 'Terror',
    videoUrl:
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
    imageUrl:
        'https://play-lh.googleusercontent.com/qJYOlnHj3UfvgwogydoxgyvjgHpLYIxNF24ihwPLOZWxEQCZhAan9pTE-6t3zysibmDl2k_udhEY_-muh3Nk',
  ),


  Movie(
    title: 'This Is Us',
    genre: 'Documental • One Direction',
    videoUrl:
        'https://www.google.com/search?q=trailer+this+is+us+one+direction&rlz=1C5CHFA_enEC1142EC1142&oq=trailer+this+is+us+o&gs_lcrp=EgZjaHJvbWUqCAgBEAAYFhgeMgYIABBFGDkyCAgBEAAYFhgeMggIAhAAGBYYHjIICAMQABgWGB4yCggEEAAYChgWGB4yCAgFEAAYFhgeMggIBhAAGBYYHjIICAcQABgWGB4yCAgIEAAYFhgeMggICRAAGBYYHtIBCDQwODdqMGo3qAIAsAIA&sourceid=chrome&ie=UTF-8#fpstate=ive&vld=cid:53ddc484,vid:XrDQQXVG1aA,st:0',
    imageUrl:
        'https://m.media-amazon.com/images/I/81NpabfCP3L.jpg',
  ),
  Movie(
    title: '5 Seconds of Summer',
    genre: 'Documental • 5SOS',
    videoUrl:
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    imageUrl:
        'https://m.media-amazon.com/images/M/MV5BZWU4YjZkNTQtNGQ4ZC00YmRhLThjYzEtZTIzNTliODZiYjBjXkEyXkFqcGc@._V1_.jpg',
  ),
  Movie(
    title: 'Avengers: Endgame',
    genre: 'Acción • Aventura',
    videoUrl:
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg',
  ),
  Movie(
    title: 'La La Land',
    genre: 'Musical • Romance',
    videoUrl:
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/a/ab/La_La_Land_%28film%29.png',
  ),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas Vistas y Para Ver',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const CardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final List<Movie> watched = [];
  final List<Movie> watchLater = [];

  void _toggleWatched(Movie movie) {
    setState(() {
      if (watched.contains(movie)) {
        watched.remove(movie);
      } else {
        watched.add(movie);
        watchLater.remove(movie);
      }
    });
  }

  void _toggleWatchLater(Movie movie) {
    setState(() {
      if (watchLater.contains(movie)) {
        watchLater.remove(movie);
      } else {
        watchLater.add(movie);
        watched.remove(movie);
      }
    });
  }

  void _openVideoPlayer(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => VideoPlayerScreen(movie: movie)),
    );
  }

  Widget movieTile(Movie movie) {
    final isWatched = watched.contains(movie);
    final isWatchLater = watchLater.contains(movie);

    return ListTile(
      leading: Image.network(
        movie.imageUrl,
        width: 50,
        height: 75,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 50,
          height: 75,
          color: Colors.grey.shade300,
          child: const Icon(Icons.movie),
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.genre),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.check_circle,
              color: isWatched ? Colors.green : Colors.grey,
            ),
            onPressed: () => _toggleWatched(movie),
          ),
          IconButton(
            icon: Icon(
              Icons.watch_later,
              color: isWatchLater ? Colors.orange : Colors.grey,
            ),
            onPressed: () => _toggleWatchLater(movie),
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () => _openVideoPlayer(movie),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final unwatchedMovies = allMovies.where((m) => !watched.contains(m) && !watchLater.contains(m)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas Vistas / Para Ver'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text('Películas Vistas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          if (watched.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('No has marcado películas como vistas.'),
            )
          else
            ...watched.map(movieTile).toList(),
          const Divider(height: 40),
          const Text('Para Ver Más Tarde', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          if (watchLater.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('No hay películas para ver más tarde.'),
            )
          else
            ...watchLater.map(movieTile).toList(),
          const Divider(height: 40),
          const Text('Películas Disponibles', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          if (unwatchedMovies.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('No quedan películas sin clasificar.'),
            )
          else
            ...unwatchedMovies.map(movieTile).toList(),
        ],
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final Movie movie;

  const VideoPlayerScreen({super.key, required this.movie});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.movie.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _initialized = true;
        });
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: _initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(color: Colors.white),
      ),
      floatingActionButton: _initialized
          ? FloatingActionButton(
              backgroundColor: Colors.indigo.shade700,
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying ? _controller.pause() : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            )
          : null,
    );
  }
}
