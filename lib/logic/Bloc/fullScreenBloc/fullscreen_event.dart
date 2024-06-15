part of 'fullscreen_bloc.dart';

@immutable
abstract class FullscreenEvent {}

class FullscreenInitialEvent extends FullscreenEvent {
  final String imageUrl;
  FullscreenInitialEvent({required this.imageUrl});
}

class SetWallPaperEvent extends FullscreenEvent {
  final String imageUrl;

  SetWallPaperEvent({required this.imageUrl});
} //SetWallPaperEven