import 'package:equatable/equatable.dart';
import 'package:movies_app_train/movies/domain/entities/detailed_movie.dart';

class AppUser extends Equatable {
  final String id;
  final String username;
  final String email;
  final String password;
  final List<DetailedMovie> favorites;
  final List<DetailedMovie> watched;
  final List<DetailedMovie> wantToWatch;
  final List<DetailedMovie> dontWantToWatch;

  const AppUser({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.favorites,
    required this.watched,
    required this.wantToWatch,
    required this.dontWantToWatch,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        password,
        favorites,
        watched,
        wantToWatch,
        dontWantToWatch,
      ];
}
