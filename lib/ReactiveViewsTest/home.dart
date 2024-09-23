import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_study_1/Movies/moviesModel.dart';

class HelloWorldScreen extends StatefulWidget {
  @override
  State<HelloWorldScreen> createState() => _HelloWorldScreenState();
}

class _HelloWorldScreenState extends State<HelloWorldScreen> {

  Future<List<MoviesMock>> getMovies() async {
    String data = await
      DefaultAssetBundle.of(context).loadString("assets/data/moviesMock.json");
    
    List mapData = jsonDecode(data);

    List<MoviesMock> movies = 
        mapData.map((movie) => MoviesMock.fromJson(movie)).toList();

      return movies;
  }

  @override
  void initState() {
    getMovies();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<MoviesMock>>(
        future: getMovies(),
        builder: (context, data) {
          if(data.hasData) {
            List<MoviesMock> movies = data.data!;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: () {
                    print(movies[index].imdbID);
                  },
                child: ListTile(
                  leading: Container(
                    width: 100,
                    height: 50,
                    child: Image.network(
                      movies[index].images![2],
                      fit: BoxFit.cover,
                      )),
                  title: Text(
                    movies[index].title!,
                    style: 
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      )
    );
  }
}