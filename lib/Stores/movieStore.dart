
import 'package:mobx/mobx.dart';
import 'package:flutter_study_1/Movies/moviesModel.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

part 'movieStore.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  @observable
  ObservableList<MoviesMock> movies = ObservableList<MoviesMock>();

  @action
  Future<void> loadMovies(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/data/moviesMock.json");
    List mapData = jsonDecode(data);
    List<MoviesMock> loadedMovies = mapData.map((movie) => MoviesMock.fromJson(movie)).toList();
    movies = ObservableList<MoviesMock>.of(loadedMovies);
  }
}