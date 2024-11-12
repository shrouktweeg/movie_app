import 'package:flutter/material.dart';
import 'package:movie_app/core/firebase_utils.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MovieProvider extends ChangeNotifier{
  Map<String, bool> savedMovies = {};
Future<void> saveBoolValue(String movieId,bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isSaved_$movieId', value);
  savedMovies[movieId] = value;
  notifyListeners();
}
  Future<void> loadSavedState(String movieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isSaved_$movieId');
    savedMovies[movieId] = savedState ?? false;
    notifyListeners();
  }
  bool isMovieSaved(String movieId) {
    return savedMovies[movieId] ?? false;
  }
  Future<void> deleteMovie(PopularMoviesModel movie) async {
    await FireBaseUtils.deleteMovie(movie).then((value) {
      print('Movie deleted successfully');
    }).catchError((error) {
      print('Error deleting movie: $error');
    });
    savedMovies[movie.id.toString()] = false;
    notifyListeners();
  }
  Future<void> addMovie(PopularMoviesModel movie) async {
    await FireBaseUtils.addMovie(movie).then((value) {
      print('Movie added successfully');
    }).catchError((error) {
      print('Error adding movie: $error');
    });
    savedMovies[movie.id.toString()] = true;
    notifyListeners();
  }
}