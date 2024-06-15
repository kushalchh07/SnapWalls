import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:meta/meta.dart';

import '../../../pages/home/fullscreen.dart';

part 'fullscreen_event.dart';
part 'fullscreen_state.dart';

class FullscreenBloc extends Bloc<FullscreenEvent, FullscreenState> {
  FullscreenBloc() : super(FullscreenInitial()) {
    on<FullscreenInitialEvent>(_fullscreenInitialEvent);
    on<SetWallPaperEvent>(_setWallPaperEvent);
  }
  FutureOr<void> _fullscreenInitialEvent(
      FullscreenInitialEvent event, Emitter<FullscreenState> emit) {
    //  log(LoadFullScreenEvent(imageUrl: event.imageUrl).toString());
    try {
      Get.to(() => FullScreen(
            imageUrl: event.imageUrl,
          ));
     
    } catch (e) {
      print(e);
    }
     emit(FullscreenLoadedState(
          // images: [],
          imageUrl: '',
          ));
  }

  Future<FutureOr<void>> _setWallPaperEvent(
      SetWallPaperEvent event, Emitter<FullscreenState> emit) async {
    // try {
    //   int location = WallpaperManager.HOME_SCREEN;
    //   var file = DefaultCacheManager().getSingleFile(event.imageUrl);

    //   String result =
    //       await WallpaperManager.setWallpaperFromFile(file, location).toString();
    // } catch (e) {
    //   // emit(FullscreenErrorState(errorMessage: e.toString()));
    // }
  }
}
