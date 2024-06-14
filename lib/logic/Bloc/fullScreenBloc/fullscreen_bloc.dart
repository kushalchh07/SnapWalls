import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:meta/meta.dart';

part 'fullscreen_event.dart';
part 'fullscreen_state.dart';

class FullscreenBloc extends Bloc<FullscreenEvent, FullscreenState> {
  FullscreenBloc() : super(FullscreenInitial()) {
    on<SetWallPaperEvent>(_setWallPaperEvent);
  }

  Future<FutureOr<void>> _setWallPaperEvent(
      SetWallPaperEvent event, Emitter<FullscreenState> emit) async {
    try {
      int location = WallpaperManager.HOME_SCREEN;
      var file = DefaultCacheManager().getSingleFile(event.imageUrl);

      String result =
          await WallpaperManager.setWallpaperFromFile(file, location).toString();
    } catch (e) {
      // emit(FullscreenErrorState(errorMessage: e.toString()));
    }
  }
}
