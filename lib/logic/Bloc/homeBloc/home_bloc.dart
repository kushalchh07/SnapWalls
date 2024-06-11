import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/data/repository/wallpaperRepository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    WallpaperRepository wallpaperRepository = WallpaperRepository();
    on<HomeInitialEvent>(_homeInitialEvent);
  }

  FutureOr<void> _homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    try {
      emit(HomeLoadingState());
      emit(HomeLoadedState());
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
