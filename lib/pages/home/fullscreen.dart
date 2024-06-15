import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wallpaper_app/logic/Bloc/fullScreenBloc/fullscreen_bloc.dart';

class FullScreen extends StatefulWidget {
  final String imageUrl;

  const FullScreen({super.key, required this.imageUrl});
  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  final FullscreenBloc fullscreenBloc = FullscreenBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullscreenBloc.add(FullscreenInitialEvent(imageUrl: widget.imageUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Wallpapers",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
      body: BlocConsumer<FullscreenBloc, FullscreenState>(
        bloc: fullscreenBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is FullscreenLoadingState) {
            log('fullscreen loading state ');
          }

          if (state is FullscreenLoadedState) {
            log('fullscreen loaded state ');

            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Image.network(widget.imageUrl),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 30.0, left: 10, right: 10),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple),
                          onPressed: () {
                            fullscreenBloc.add(
                                SetWallPaperEvent(imageUrl: widget.imageUrl));
                          },
                          child: Text(
                            'Set WallPaper',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
            );
          }

          if (state is FullscreenErrorState) {
            log('fullscreen error state ');
          }
          log('Complete error state state ');

          return Container();
        },
      ),
    );
  }
}
