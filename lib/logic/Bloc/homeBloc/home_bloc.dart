import 'dart:async';
import 'dart:convert';

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/data/models/wallpaper_model.dart';
import 'package:wallpaper_app/data/repository/wallpaperRepository.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/pages/home/fullscreen.dart';
part 'home_event.dart';
part 'home_state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   HomeBloc() : super(HomeInitial()) {
//     on<HomeInitialEvent>(_homeInitialEvent);
//     on<LoadMoreEvent>(_loadMoreEvent);
//   }

//   FutureOr<void> _homeInitialEvent(
//       HomeInitialEvent event, Emitter<HomeState> emit) async {
//     var client = http.Client();
//     // List<Photo> wallpapers = [];
//     try {
//       // emit(HomeLoadingState());

//       var response = await client.get(
//           Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
//           headers: {
//             'Authorization':
//                 'ub1jVSB2BzOMVBpEnRCObkK3sE7YQ7tDvWNxxy1Wb5uSjgCPdVi3GwK2'
//           });

//       // final List<dynamic> data = jsonDecode(response.body)['photos'];
//       // final List<WallpaperModel> images =
//       //     data.map((json) => WallpaperModel.fromJson(json)).toList();
//       var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
//       WallpaperModel wallpaperModel = WallpaperModel.fromJson(jsonResponse);

//       emit(HomeLoadedState(images: wallpaperModel.photos));
//       // log(response.body);
//     } catch (e) {
//       print(e);
//       log(e.toString());
//       // rethrow;
//     } finally {
//       client.close();
//     }
//   }

//   FutureOr<void> _loadMoreEvent(
//       LoadMoreEvent event, Emitter<HomeState> emit) async {
//     var client = http.Client();
//     // List<Photo> wallpapers = [];
//     try {
//       // emit(HomeLoadingState());
//       var page = 1;
//       var response = await client.get(
//           Uri.parse('https://api.pexels.com/v1/curated?per_page=80&page=' +
//               {page + 1}.toString()),
//           headers: {
//             'Authorization':
//                 'ub1jVSB2BzOMVBpEnRCObkK3sE7YQ7tDvWNxxy1Wb5uSjgCPdVi3GwK2'
//           });

//       // final List<dynamic> data = jsonDecode(response.body)['photos'];
//       // final List<WallpaperModel> images =
//       //  data.map((json) => WallpaperModel.fromJson(json)).toList();
//       var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
//       WallpaperModel wallpaperModel = WallpaperModel.fromJson(jsonResponse);

//       emit(HomeLoadedState(images: wallpaperModel.photos));
//       // log(response.body);
//     } catch (e) {
//       print(e);
//       log(e.toString());
//       // rethrow;
//     } finally {
//       client.close();
//     }
//   }
// }
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_homeInitialEvent);
    on<LoadMoreEvent>(_loadMoreEvent);
  }

  final String apiKey =
      'ub1jVSB2BzOMVBpEnRCObkK3sE7YQ7tDvWNxxy1Wb5uSjgCPdVi3GwK2';
  int page = 1;

  FutureOr<void> _homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await _fetchWallpapers(emit);
  }

  FutureOr<void> _loadMoreEvent(
      LoadMoreEvent event, Emitter<HomeState> emit) async {
    await _fetchWallpapers(emit);
  }

  Future<void> _fetchWallpapers(Emitter<HomeState> emit) async {
    var client = http.Client();
    try {
      var response = await client.get(
          Uri.parse('https://api.pexels.com/v1/curated?page=$page&per_page=30'),
          headers: {
            'Authorization': apiKey,
          });

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        WallpaperModel wallpaperModel = WallpaperModel.fromJson(jsonResponse);

        List<Photo> currentImages = [];
        if (state is HomeLoadedState) {
          currentImages = List.from((state as HomeLoadedState).images);
        }

        currentImages.addAll(wallpaperModel.photos);

        emit(HomeLoadedState(images: currentImages));

        // log(response.body);
        page++;
      } else {
        emit(HomeErrorState(errorMessage: 'Failed to fetch wallpapers'));
      }
    } catch (e) {
      emit(HomeErrorState(errorMessage: e.toString()));
    } finally {
      client.close();
    }
  }

  // FutureOr<void> _loadFullScreenEvent(
  //     LoadFullScreenEvent event, Emitter<HomeState> emit) {

  // }
}
