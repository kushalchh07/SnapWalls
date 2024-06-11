part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingErrorState extends HomeState {}
