class Movie {
  final String title;
  final String thumbnailUrl;
  final String videoUrl;

  Movie({
    required this.title,
    required this.thumbnailUrl,
    required this.videoUrl,
  });
}

final List<Movie> movies = [
  Movie(
    title: 'ONE DIRECTION - THIS IS US',
    thumbnailUrl: 'https://upload.wikimedia.org/wikipedia/en/4/4a/One_Direction_-_This_Is_Us.jpg',
    videoUrl: 'https://ixqeqjsaxtuaqidpboqj.supabase.co/storage/v1/object/public/peliculas//ONE%20DIRECTION%20-%201D_%20THIS%20IS%20US%20-%20Official%20Trailer%20(HD).mp4',
  ),
];
