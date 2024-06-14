import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FullscreenBloc, FullscreenState>(
        bloc: fullscreenBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is FullscreenLoadingState) {}

          if (state is FullscreenLoadedState) {
            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Image.network(widget.imageUrl),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Set WallPaper',
                          style: TextStyle(color: Colors.black),
                        )),
                  )
                ],
              ),
            );
          }

          if (state is FullscreenErrorState) {}
          return Container();
        },
      ),
    );
  }
}
