part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Initial extends SplashScreenState {}

class Loading extends SplashScreenState {
  final String greeting;
  Loading(this.greeting);

  @override
  String toString() => greeting;
}

class Loaded extends SplashScreenState {}