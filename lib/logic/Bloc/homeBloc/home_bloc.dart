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
    on<HomeInitialEvent>(_homeInitialEvent);
  }

  FutureOr<void> _homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    var client = http.Client();
    List<Photo> wallpapers = [];
    try {
      // emit(HomeLoadingState());

      var response = await client
          .get(Uri.parse('https://api.pexels.com/v1/curated'), headers: {
        'Authorization':
            'ub1jVSB2BzOMVBpEnRCObkK3sE7YQ7tDvWNxxy1Wb5uSjgCPdVi3GwK2'
      });

      // final List<dynamic> data = jsonDecode(response.body)['photos'];
      // final List<WallpaperModel> images =
      //     data.map((json) => WallpaperModel.fromJson(json)).toList();
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        WallpaperModel wallpaperModel = WallpaperModel.fromJson(jsonResponse);

      emit(HomeLoadedState(images: wallpaperModel.photos));
      // log(response.body);
    } catch (e) {
      print(e);
      log(e.toString());
      // rethrow;
    } finally {
      client.close();
    }
  }
}
