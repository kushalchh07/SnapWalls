part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class LoadMoreEvent extends HomeEvent {}

class LoadFullScreenEvent extends HomeEvent {
  final String imageUrl;

  LoadFullScreenEvent({required this.imageUrl});
}
