import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_study_1/Navigation/app_routes.dart';
import '../Stores/movieStore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoviesViewMobx extends StatefulWidget {
  const MoviesViewMobx({super.key});

  @override
  State<MoviesViewMobx> createState() => _MoviesViewMobxState();
}

class _MoviesViewMobxState extends State<MoviesViewMobx> {
  final MovieStore _store = MovieStore();

  @override
  void initState() {
    super.initState();
    _store.loadMovies(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movies", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      body: Observer(
        builder: (_) {
          if (_store.movies.isEmpty) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: _store.movies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Modular.to.pushNamed(AppRoutes.movieDetailsView.route, arguments: _store.movies[index]);
                  },
                  child: ListTile(
                    leading: Container( width: 100, height: 50,
                      child: Image.network(
                        _store.movies[index].images![2], fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      _store.movies[index].title!,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
