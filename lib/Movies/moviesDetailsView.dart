import 'package:flutter/material.dart';
//import 'package:flutter_modular/flutter_modular.dart';
import 'moviesModel.dart';

class MovieDetailsView extends StatelessWidget {
  //armazena instancia do Mock
  final MoviesMock movie;
  //construtor que pede como para obrigatorio movie, passado por argumento na navegacao e inicializa com o valor
  const MovieDetailsView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title!)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie.images![1], fit: BoxFit.cover),
            Padding(padding: const EdgeInsets.all(16.0), child: Text(movie.plot!, style: TextStyle(fontSize: 18),),
            )
          ],
        ),
      ),
    );
  }
}
