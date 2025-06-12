part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeSearchPressed extends HomeEvent {}

final class HomeLoginRequested extends HomeEvent {
  final String username;
  final String password;

  const HomeLoginRequested({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

final class HomeCerrarSesion extends HomeEvent{}