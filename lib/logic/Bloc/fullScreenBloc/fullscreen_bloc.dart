import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fullscreen_event.dart';
part 'fullscreen_state.dart';

class FullscreenBloc extends Bloc<FullscreenEvent, FullscreenState> {
  FullscreenBloc() : super(FullscreenInitial()) {
    on<SetWallPaperEvent>(_setWallPaperEvent);
  }

  FutureOr<void> _setWallPaperEvent(
      SetWallPaperEvent event, Emitter<FullscreenState> emit) {
    try {
      int location = WallpaperManager.HOME_SCREEN;
      var file = DefaultCacheManager().getSingleFile(event.imageUrl);
      
    } catch (e) {
      // emit(FullscreenErrorState(errorMessage: e.toString()));
    }
  }
}
