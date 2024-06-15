part of 'fullscreen_bloc.dart';

@immutable
abstract class FullscreenState {}

class FullscreenInitial extends FullscreenState {}

class FullscreenLoadedState extends FullscreenState {
  final String imageUrl;

  FullscreenLoadedState({
    required this.imageUrl,
    // required List images,
  });
}

class FullscreenLoadingState extends FullscreenState {}

class FullscreenErrorState extends FullscreenState {}
