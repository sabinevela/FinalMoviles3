class Movie {
  final String title;
  final String thumbnailUrl;
  final String videoUrl;
  final String genre;
  final String description;
  final String year;

  Movie({
    required this.title,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.genre,
    required this.description,
    required this.year,
  });
}

final List<Movie> movies = [
  // DOCUMENTALES 🎤💫
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