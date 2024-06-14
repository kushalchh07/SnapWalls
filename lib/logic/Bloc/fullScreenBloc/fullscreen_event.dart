part of 'fullscreen_bloc.dart';

@immutable
abstract class FullscreenEvent {}

class SetWallPaperEvent extends FullscreenEvent {
  final String imageUrl;

  SetWallPaperEvent({required this.imageUrl});

} //SetWallPaperEven