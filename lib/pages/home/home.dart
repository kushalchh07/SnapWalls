// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/data/models/wallpaper_model.dart';
import 'package:wallpaper_app/logic/Bloc/fullScreenBloc/fullscreen_bloc.dart';
import 'package:wallpaper_app/logic/Bloc/homeBloc/home_bloc.dart';
import 'package:wallpaper_app/pages/home/fullscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
final FullscreenBloc fullscreenBloc = FullscreenBloc();
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeLoadingState) {
            log('home loading state ');

            return Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (state is HomeLoadedState) {
            log('home loaded state ');
            final successState = state as HomeLoadedState;

            return Scaffold(
              appBar: AppBar(
                title: Text("Wallpapers"),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: GridView.builder(
                          itemCount: successState.images.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 2,
                                  childAspectRatio: 2 / 3,
                                  mainAxisSpacing: 2),
                          itemBuilder: (context, index) {
                            log('${state.images[0].src.tiny}');
                            // log('${state.images[0].photos![index].src!}');

                            // final WallpaperModel image = state.images[index].photos[0].src.tiny
                            return GestureDetector(
                              onTap: () {
                                fullscreenBloc.add(FullscreenInitialEvent(
                                    imageUrl: state.images[index].src.large));

                                // Get.to(FullScreen(
                                //     imageUrl: state.images[index].src.large));
                              },
                              child: Container(
                                child: Card(
                                  child: Image.network(
                                    state.images[index].src.tiny,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      homeBloc.add(LoadMoreEvent());
                      log('${state.images[0].src.tiny}');
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "Load More",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
            );
          }
          if (state is HomeErrorState) {
            log('home error ');

            return Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}


