import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_cache_manager/file.dart';
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

  /// Sets the wallpaper for the given [imageUrl] on the HOME_SCREEN location.
  ///
  /// Throws an [Exception] if the [imageUrl] file is null or if the result of
  /// setting the wallpaper is null.
  ///
  /// Emits a [FullscreenErrorState] if an error occurs.
  ///
  /// Returns a [Future] that completes when the wallpaper is set.
  Future<void> _setWallPaperEvent(
    SetWallPaperEvent event,
    Emitter<FullscreenState> emit,
  ) async {
    try {
      int location = WallpaperManager.HOME_SCREEN;
      File? file = await DefaultCacheManager().getSingleFile(event.imageUrl);

      if (file == null) {
        throw Exception('File is null');
      }

      String result = await WallpaperManager.setWallpaperFromFile(
        file.path,
        location,
      ).toString();

      if (result == null) {
        throw Exception('Result is null');
      }

      emit(SetWallPaperState());

    } catch (e) {
      emit(FullscreenErrorState(errorMessage: e.toString()));
    }
  }
}
