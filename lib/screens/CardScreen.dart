import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_taller/models/movies.dart';

final List<Movie> allMovies = [
  Movie(
    title: 'ONE DIRECTION - THIS IS US',
    thumbnailUrl: 'https://m.media-amazon.com/images/I/81NpabfCP3L.jpg',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//ONE%20DIRECTION%20-%201D_%20THIS%20IS%20US%20-%20Official%20Trailer%20(HD).mp4',
    genre: 'Documentales',
    description: 'Una mirada íntima al ascenso meteórico de One Direction, con escenas de su gira mundial y testimonios personales.',
    year: '2013',
  ),
  Movie(
    title: 'TAYLOR SWIFT - THE ERAS TOUR',
    thumbnailUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3dkiGnaaK52WmPjzYSU7aAZsnjgXPF-74YhIRC4A9WhYHDYeG',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//TAYLOR%20SWIFT%20_%20THE%20ERAS%20TOUR%20Concert%20Film%20Official%20Trailer.mp4',
    genre: 'Documentales',
    description: 'Un impresionante concierto cinematográfico que celebra todas las eras musicales de Taylor Swift.',
    year: '2023',
  ),
  Movie(
    title: 'BRITNEY - VS SPEARS',
    thumbnailUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQimgRg8aV30yQyOrTlFuKDOzIkqxlAI_MalmxclMa-gDPea5t',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//Britney%20vs%20Spears%20_%20Official%20Trailer%20_%20Netflix.mp4',
    genre: 'Documentales',
    description: 'Una investigación acerca de la lucha de Britney Spears por obtener su libertad de la tutela, con entrevistas exclusivas y documentos confidenciales sobre el controversial proceso.',
    year: '2021',
  ),
  Movie(
    title: 'BLACKPINK: LIGHT UP THE SKY',
    thumbnailUrl: 'https://upload.wikimedia.org/wikipedia/en/e/ed/Blackpink_Light_Up_the_Sky_poster.png',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//BLACKPINK_%20LIGHT%20UP%20THE%20SKY%20_%20Official%20Trailer%20_%20Netflix.mp4',
    genre: 'Documentales',
    description: 'El ascenso de BLACKPINK al estrellato, con imágenes exclusivas y entrevistas sinceras.',
    year: '2020',
  ),

  // ACCIÓN 💥🔥
  Movie(
    title: 'UNDISPUTED 3',
    thumbnailUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw_yq6H0KDWftvFZeZ5-ZR5QGnaf2r7Qm3ZfAXv5tQwRW89_PlhRCslJLLFsX-lcU78h_tF5njSpLVAhYVEI9DZ4pq7zyUpZxuiQ4_Uw',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//Undisputed%203%20-%20Official%20Trailer.mp4',
    genre: 'Acción',
    description: 'Un campeón de lucha profesional es trasladado a una prisión ucraniana para participar en un torneo en el que se competirá a vida o muerte con apuestas millonarias y en el que el vencedor obtendrá la libertad.',
    year: '2010',
  ),
  Movie(
    title: 'JOHN WICK 4',
    thumbnailUrl: 'https://m.media-amazon.com/images/I/81J1DaRKzUL._AC_UF894,1000_QL80_.jpg',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//videoplayback.mp4',
    genre: 'Acción',
    description: 'John Wick enfrenta a un nuevo enemigo global mientras busca su libertad definitiva.',
    year: '2023',
  ),
  Movie(
    title: 'DESTINO FINAL: LAZOS DE SANGRE',
    thumbnailUrl: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcThrAg4hNvLPLvhDPArKMVNU2t7FJWXlblnkvugxlq2VtsUdb6H',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//DestinoFinal.mp4',
    genre: 'Acción',
    description: 'Atormentada por una violenta pesadilla recurrente, Stefani regresa a casa para salvar a su familia.',
    year: '2025',
  ),

  // COMEDIA 😂🍿
  Movie(
    title: 'CON TODOS MENOS CONTIGO',
    thumbnailUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxSkR_zRj9Qhs0CHnxYFkDs3MUIK2oHcItyWCAcqA9fLsxXhzm',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//contodos.mp4',
    genre: 'Comedia',
    description: 'Bea y Ben, antiguos compañeros de universidad cuya mutua atracción inicial se tornó asco, se encuentran inesperadamente juntos en una boda en Australia y fingen ser la pareja perfecta para mantener las apariencias.',
    year: '2023',
  ),
  Movie(
    title: 'LA OTRA BODA',
    thumbnailUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTww3Vf9Vma3Uns9ltNgocShfEGJrURJcVqyeIeJZLOz8gK2tRp',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//otraboda.mp4',
    genre: 'Comedia',
    description: 'Una mujer que planea la boda ideal de su hermana y el padre de una futura novia descubren que sus bodas están reservadas al mismo tiempo. Cuando ambas partes deciden compartir el pequeño lugar, sobreviene el caos y aguarda el desastre.',
    year: '2025',
  ),

  // ROMANCE 💕🎬
  Movie(
    title: 'THE NOTEBOOK',
    thumbnailUrl: 'https://m.media-amazon.com/images/M/MV5BNTYxMDliN2QtNTMwNC00ODU3LWFhODgtMWFhODQ0Mzc0NGE0XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//The%20Notebook%20(2004)%20Official%20Trailer%20-%20Ryan%20Gosling%20Movie.mp4',
    genre: 'Romance',
    description: 'Una historia de amor inolvidable entre Noah y Allie a través de los años y la distancia.',
    year: '2004',
  ),
  Movie(
    title: 'LA ULTIMA CANCION',
    thumbnailUrl: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTwdBjojtNm-EqEGJs5tGsM0rqKgApm6L_hVqMu_jBVEzKciawk',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//cancion.mp4',
    genre: 'Romance',
    description: 'En una ciudad de playa del sur, un hombre intenta entrar en contacto con su hija distanciada a través de su amor compartido por la música.',
    year: '2010',
  ),

  // DRAMA 🎭📽️
  Movie(
    title: 'THE PURSUIT OF HAPPYNESS',
    thumbnailUrl: 'https://m.media-amazon.com/images/S/pv-target-images/3aadbc7110f4b426b8c7505483a27d037237c82a383ddc19585cd42f4a3d64b4.jpg',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//The%20Pursuit%20of%20Happyness%20(2006)%20Official%20Trailer%201%20-%20Will%20Smith%20Movie.mp4',
    genre: 'Drama',
    description: 'La inspiradora historia real de Chris Gardner, un padre soltero que lucha por una mejor vida.',
    year: '2006',
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
      // Sin ThemeData personalizado
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
      MaterialPageRoute(builder: (_) => VideoPlayerScreen(videoUrl: movie.videoUrl)),
    );
  }

  Widget movieTile(Movie movie) {
    final isWatched = watched.contains(movie);
    final isWatchLater = watchLater.contains(movie);

    return ListTile(
      leading: Image.network(
        movie.thumbnailUrl,
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
              color: isWatched ? Colors.green : null,
            ),
            onPressed: () => _toggleWatched(movie),
          ),
          IconButton(
            icon: Icon(
              Icons.watch_later,
              color: isWatchLater ? Colors.orange : null,
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
  final String videoUrl;

  const VideoPlayerScreen({required this.videoUrl, Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isSeeking = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.addListener(() {
      if (!_isSeeking) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rewind() {
    final currentPosition = _controller.value.position;
    final rewindPosition = currentPosition - const Duration(seconds: 10);
    _controller.seekTo(rewindPosition > Duration.zero ? rewindPosition : Duration.zero);
  }

  void _forward() {
    final currentPosition = _controller.value.position;
    final duration = _controller.value.duration;
    final forwardPosition = currentPosition + const Duration(seconds: 10);
    if (forwardPosition < duration) {
      _controller.seekTo(forwardPosition);
    } else {
      _controller.seekTo(duration);
    }
  }

  void _download() async {
    final url = Uri.parse(widget.videoUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo abrir el enlace de descarga')),
      );
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final isInitialized = _controller.value.isInitialized;
    final position = isInitialized
        ? _controller.value.position.inMilliseconds.toDouble()
        : 0.0;
    final duration = isInitialized
        ? _controller.value.duration.inMilliseconds.toDouble()
        : 1.0;

    final sliderValue = position.clamp(0.0, duration);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reproductor de Video'),
      ),
      body: Center(
        child: isInitialized
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  const SizedBox(height: 20),
                  Slider(
                    min: 0,
                    max: duration,
                    value: sliderValue,
                    onChangeStart: (_) {
                      _isSeeking = true;
                    },
                    onChanged: (value) {
                      setState(() {
                        _controller.seekTo(Duration(milliseconds: value.toInt()));
                      });
                    },
                    onChangeEnd: (_) {
                      _isSeeking = false;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_formatDuration(_controller.value.position)),
                        Text(_formatDuration(_controller.value.duration)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.replay_10),
                        iconSize: 36,
                        onPressed: _rewind,
                      ),
                      IconButton(
                        icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
                        iconSize: 36,
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.forward_10),
                        iconSize: 36,
                        onPressed: _forward,
                      ),
                      IconButton(
                        icon: const Icon(Icons.download),
                        iconSize: 36,
                        onPressed: _download,
                      ),
                    ],
                  )
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}