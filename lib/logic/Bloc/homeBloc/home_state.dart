part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<Photo> images;

   HomeLoadedState({required this.images});

  // @override
  // List<Object> get props => [images];
}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMessage;

   HomeErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
