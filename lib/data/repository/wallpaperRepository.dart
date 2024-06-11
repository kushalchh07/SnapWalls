import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:wallpaper_app/data/repository/api/api.dart';
import 'package:http/http.dart' as http;

class WallpaperRepository {
  Future<dynamic> fetchWallpapers() async {
    API api = API();

    try {
      var response =
          await http.get(Uri.parse('https://api.pexels.com/v1/curated'));
      var val = jsonDecode(response.body);
      // log(response.body);
      // log(data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
