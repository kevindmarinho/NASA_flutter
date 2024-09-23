import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_study_1/Nasa_Module/Screens/APODView.dart';
import 'package:flutter_study_1/Navigation/app_routes.dart';
// import 'package:flutter_study_1/Navigation/view1_page.dart';
// import '../Stores/movieStore.dart';
import 'package:flutter_study_1/Movies/moviesDetailsView.dart';
import 'package:flutter_study_1/Movies/moviesViewMobx.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => ApodView());
    r.child(AppRoutes.movieDetailsView.route, child: (context) => MovieDetailsView(movie: r.args.data), transition: TransitionType.defaultTransition);
  }  
}