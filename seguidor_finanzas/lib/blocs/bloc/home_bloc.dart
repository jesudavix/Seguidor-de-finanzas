import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:seguidor_finanzas/models/model_user.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoginRequested>(_onLoginRequested);
    on<HomeCerrarSesion>((event, emit) => emit(HomeInitial()));
  }

  Future<void> _onLoginRequested(
    HomeLoginRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadInProgress());
    await Future.delayed(const Duration(milliseconds: 100));

    try {
      final url = Uri.parse(
        'https://run.mocky.io/v3/392d4730-cab5-4700-8b6d-af4a528a2ac3',
      );

      final res = await http.get(url);
      if (res.statusCode != 200) {
        emit(HomeFailure(message: 'Error al conectar con el servidor'));
        return;
      }

      final List<dynamic> data = json.decode(res.body);
      final List<User> users = data.map((json) => User.fromJson(json)).toList();

      final user = users.firstWhere(
        (u) =>
            u.username == event.username.trim() &&
            u.password == event.password.trim(),
        orElse: () => User(username: '', password: ''),
      );

      if (user.username.isNotEmpty) {
        emit(HomeLoadSuccess(nombreUsuario: user.username));
      } else {
        emit(
          HomeFailure(message: 'Nombre de usuario o contraseña incorrectos'),
        );
      }
    } catch (e) {
      emit(HomeFailure(message: 'Error inesperado: $e'));
    }
  }
}
