part of 'fullscreen_bloc.dart';

@immutable
sealed class FullscreenState {}

final class FullscreenInitial extends FullscreenState {}
final class FullscreenLoadedState extends FullscreenState {}
final class FullscreenLoadingState extends FullscreenState {}
final class FullscreenErrorState extends FullscreenState {}
