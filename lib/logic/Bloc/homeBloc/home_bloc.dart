import 'dart:async';
import 'dart:convert';

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/data/models/wallpaper_model.dart';
import 'package:wallpaper_app/data/repository/wallpaperRepository.dart';
import 'package:http/http.dart' as http;
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    WallpaperRepository wallpaperRepository = WallpaperRepository();
    on<HomeInitialEvent>(_homeInitialEvent);
  }

  FutureOr<void> _homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    var client = http.Client();
    List<WallpaperModel> wallpapers = [];
    try {
      emit(HomeLoadingState());

      var response = await client
          .get(Uri.parse('https://api.pexels.com/v1/curated'), headers: {
        'Authorization':
            'ub1jVSB2BzOMVBpEnRCObkK3sE7YQ7tDvWNxxy1Wb5uSjgCPdVi3GwK2'
      });

      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      List result = jsonResponse['photos'] as List;

      for (int i = 0; i < result.length; i++) {
        WallpaperModel wallpaper =
            WallpaperModel.fromMap(result[i] as Map<String, dynamic>);
        wallpapers.add(wallpaper);
      }

      log(wallpapers.toString());
      emit(HomeLoadedState(wallpapers: wallpapers));
    } catch (e) {
      print(e);
      rethrow;
    } finally {
      client.close();
    }
  }
}
