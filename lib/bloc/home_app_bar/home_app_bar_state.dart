part of 'home_app_bar_bloc.dart';

@immutable
abstract class HomeAppBarState {}

class HomeAppBarInitial extends HomeAppBarState {}

class HomeAppBarLoading extends HomeAppBarState {}

class HomeAppBarLoaded extends HomeAppBarState {}

class HomeAppBarError extends HomeAppBarState {}
