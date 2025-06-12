part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadInProgress extends HomeState {}

final class HomeLoadSuccess extends HomeState {
  final String nombreUsuario;

  const HomeLoadSuccess({required this.nombreUsuario});

  @override
  List<Object> get props => [nombreUsuario];
}

final class HomeFailure extends HomeState {
  final String message;

  const HomeFailure({required this.message});

  @override
  List<Object?> get props => [message];
}