part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<WallpaperModel> wallpapers;

  HomeLoadedState({required this.wallpapers});
}

class HomeLoadingState extends HomeState {}

class HomeLoadingErrorState extends HomeState {}
