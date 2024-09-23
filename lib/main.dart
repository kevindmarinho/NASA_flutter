import 'package:flutter/material.dart';
import 'package:flutter_study_1/Services/localization_service.dart';
import 'Movies/moviesViewMobx.dart';
import 'Navigation/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
//import 'counterView.dart';
//import 'ValueNotifier.dart';
//import 'RiverPod.dart';
//import 'RxDart.dart';
//import 'Stores/nameStore.dart';
//import 'package:flutter_study_1/ReactiveViewsTest/mobX.dart';

//utiliza o construtor do Modular(ModularApp) direcionar para o modulo principal AppModule que obtem as rotas do app pelo app modular
//o ModularApp tambem requer um parametro de child 
void main() {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  Widget build(BuildContext context){
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      localeResolutionCallback: LocalizationService.localeResolutionCallBack,
      supportedLocales: LocalizationService.supportedLocales,
      localizationsDelegates: LocalizationService.localizationsDelegate,
    ); //added by extension 
  }
}