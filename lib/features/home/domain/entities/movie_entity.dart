import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable{
 final int id;
  final String? backdropPath;
  final String? posterPath;
 final  String originalTitle;
 final  String releaseDate;
 final double voteAverage;
 final String overView;
 final List<dynamic>?genreIds;
 final List<dynamic>?genres;
 final String? homePath;

  const MovieEntity( {
   required this.id,
   required this.backdropPath,
   required this.posterPath,
   required this.originalTitle,
   required this.releaseDate,
   required this.voteAverage,
   required this.overView,
   required this.genreIds,
   this.homePath,
   this.genres,
  });



  @override
  // TODO: implement props
  List<Object?> get props => [id,backdropPath,originalTitle,releaseDate,posterPath,voteAverage,overView];

}