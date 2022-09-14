import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String posterPath;

  const Movie({
    required this.id,
    required this.posterPath,
    required this.title,
  });
  
  @override
  List<Object?> get props => [
    id,
    title,
    posterPath,
  ];
}
