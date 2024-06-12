import 'dart:convert';

WallpaperModel wallpaperModelFromJson(String str) =>
    WallpaperModel.fromMap(json.decode(str));

String wallpaperModelToJson(WallpaperModel data) => json.encode(data.toMap());

class WallpaperModel {
  int page;
  int perPage;
  List<Photo> photos;
  String nextPage;

  WallpaperModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.nextPage,
  });

  factory WallpaperModel.fromMap(Map<String, dynamic> json) => WallpaperModel(
        page: json["page"] ?? 0,
        perPage: json["per_page"] ?? 0,
        photos: json["photos"] != null
            ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x)))
            : [],
        nextPage: json["next_page"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "per_page": perPage,
        "photos": List<dynamic>.from(photos.map((x) => x.toMap())),
        "next_page": nextPage,
      };
}

class Photo {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String avgColor;
  Src src;
  bool liked;
  String alt;

  Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"] ?? 0,
        width: json["width"] ?? 0,
        height: json["height"] ?? 0,
        url: json["url"] ?? '',
        photographer: json["photographer"] ?? 'Unknown',
        photographerUrl: json["photographer_url"] ?? '',
        photographerId: json["photographer_id"] ?? 0,
        avgColor: json["avg_color"] ?? '',
        src: json["src"] != null ? Src.fromJson(json["src"]) : Src.defaultSrc(),
        liked: json["liked"] ?? false,
        alt: json["alt"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        "src": src.toMap(),
        "liked": liked,
        "alt": alt,
      };
}

class Src {
  String original;
  String large2X;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"] ?? '',
        large2X: json["large2x"] ?? '',
        large: json["large"] ?? '',
        medium: json["medium"] ?? '',
        small: json["small"] ?? '',
        portrait: json["portrait"] ?? '',
        landscape: json["landscape"] ?? '',
        tiny: json["tiny"] ?? '',
      );

  factory Src.defaultSrc() => Src(
        original: '',
        large2X: '',
        large: '',
        medium: '',
        small: '',
        portrait: '',
        landscape: '',
        tiny: '',
      );

  Map<String, dynamic> toMap() => {
        "original": original,
        "large2x": large2X,
        "large": large,
        "medium": medium,
        "small": small,
        "portrait": portrait,
        "landscape": landscape,
        "tiny": tiny,
      };
}
