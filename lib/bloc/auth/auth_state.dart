part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  // const AuthState();
  @override
  List<Object> get props => [];
}

class Loading extends AuthState {}

class Authenticated extends AuthState {
  final String displayName;
  final String email;
  final String photoURL;
  Authenticated(this.displayName, this.email, this.photoURL);

  @override
  List<Object> get props => [displayName, email, photoURL];
}

class UnAuthenticated extends AuthState {
  @override
  String toString() => 'Uninitialized';
}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}
