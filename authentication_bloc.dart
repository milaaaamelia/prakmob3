// authentication_bloc.dart
import 'package:bloc/bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService authService;

  AuthenticationBloc(this.authService) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AuthenticationLoginEvent) {
      final isLoggedIn = await authService.login(event.username, event.password);
      if (isLoggedIn) {
        yield AuthenticationLoggedInState();
      } else {
        yield AuthenticationErrorState();
      }
    } else if (event is AuthenticationLogoutEvent) {
      await authService.logout();
      yield AuthenticationLoggedOutState();
    }
  }
}

// authentication_event.dart
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationLoginEvent extends AuthenticationEvent {
  final String username;
  final String password;

  AuthenticationLoginEvent({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class AuthenticationLogoutEvent extends AuthenticationEvent {}

// authentication_state.dart
import 'package:equatable/equatable.dart';
import 'package:prakmob3/services/authentication_service.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoggedInState extends AuthenticationState {}

class AuthenticationLoggedOutState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {}
