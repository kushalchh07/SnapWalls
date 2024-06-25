import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wallpaper_app/logic/Bloc/fullScreenBloc/fullscreen_bloc.dart';
import 'package:wallpaper_app/logic/Bloc/homeBloc/home_bloc.dart';
import 'package:wallpaper_app/pages/home/home.dart';
import 'package:wallpaper_app/pages/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<FullscreenBloc>(
          create: (context) => FullscreenBloc(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Snap Walls',
        theme: ThemeData(),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
