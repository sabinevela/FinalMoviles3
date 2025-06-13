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
    title: 'SHAWN MENDES - IN WONDER',
    thumbnailUrl: 'https://m.media-amazon.com/images/M/MV5BMmU2NDJlNTctOTIzZC00NzgxLTkxMGEtYmI4NTdlNzJhNjk4XkEyXkFqcGc@._V1_.jpg',
    videoUrl: 'https://supabase_link/shawn_inwonder.mp4',
    genre: 'Documentales',
    description: 'Un retrato introspectivo de Shawn Mendes que explora su vida, creatividad y presiones de la fama.',
    year: '2020',
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
    title: 'SPIDER-MAN: NO WAY HOME',
    thumbnailUrl: 'https://es.web.img2.acsta.net/c_300_300/pictures/21/12/01/12/07/0243323.jpg',
    videoUrl: 'https://supabase_link/spiderman.mp4',
    genre: 'Acción',
    description: 'Peter Parker lucha con las consecuencias del multiverso cuando villanos y versiones de sí mismo aparecen.',
    year: '2021',
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
    title: 'AVENGERS: ENDGAME',
    thumbnailUrl: 'https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SY679_.jpg',
    videoUrl: 'https://supabase_link/endgame.mp4',
    genre: 'Acción',
    description: 'Los Vengadores se reúnen para revertir el chasquido de Thanos y restaurar el universo.',
    year: '2019',
  ),

  // COMEDIA 😂🍿
  Movie(
    title: 'FREE GUY',
    thumbnailUrl: 'https://lumiere-a.akamaihd.net/v1/images/b1_poster_2_-_las_d0abe55b.jpeg',
    videoUrl: 'https://supabase_link/freeguy.mp4',
    genre: 'Comedia',
    description: 'Un cajero de banco descubre que es un personaje en un videojuego y decide ser el héroe.',
    year: '2021',
  ),
  Movie(
    title: 'JUMANJI: WELCOME TO THE JUNGLE',
    thumbnailUrl: 'https://images.justwatch.com/poster/15683847/s718/jumanji-welcome-to-the-jungle.jpg',
    videoUrl: 'https://supabase_link/jumanji.mp4',
    genre: 'Comedia',
    description: 'Cuatro adolescentes entran en el videojuego de Jumanji y deben superar desafíos para volver.',
    year: '2017',
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
    title: 'ME BEFORE YOU',
    thumbnailUrl: 'https://m.media-amazon.com/images/I/81JkrOC3MjL._AC_UF894,1000_QL80_.jpg',
    videoUrl: 'https://supabase_link/mebeforeyou.mp4',
    genre: 'Romance',
    description: 'Louisa se convierte en cuidadora de Will, un joven millonario que ha perdido la voluntad de vivir.',
    year: '2016',
  ),

  // DRAMA 🎭📽️
  Movie(
    title: 'INTERSTELLAR',
    thumbnailUrl: 'https://musicart.xboxlive.com/7/912b1000-0000-0000-0000-000000000002/504/image.jpg',
    videoUrl: 'https://supabase_link/interstellar.mp4',
    genre: 'Drama',
    description: 'Un equipo de astronautas viaja por un agujero de gusano en busca de un nuevo hogar para la humanidad.',
    year: '2014',
  ),
  Movie(
    title: 'THE PURSUIT OF HAPPYNESS',
    thumbnailUrl: 'https://m.media-amazon.com/images/S/pv-target-images/3aadbc7110f4b426b8c7505483a27d037237c82a383ddc19585cd42f4a3d64b4.jpg',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//The%20Pursuit%20of%20Happyness%20(2006)%20Official%20Trailer%201%20-%20Will%20Smith%20Movie.mp4',
    genre: 'Drama',
    description: 'La inspiradora historia real de Chris Gardner, un padre soltero que lucha por una mejor vida.',
    year: '2006',
  ),
];