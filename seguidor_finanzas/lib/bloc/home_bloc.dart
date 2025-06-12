import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    // Evento de búsqueda (lo dejas si lo usas en otra parte)
    on<HomeSearchPressed>((event, emit) async {
      emit(HomeLoadInProgress());
      await Future.delayed(const Duration(seconds: 3));
      final url = Uri.parse(
        'https://run.mocky.io/v3/392d4730-cab5-4700-8b6d-af4a528a2ac3',
      );
      final response = await http.get(url);
      if (response.statusCode == 200) {
        emit(HomeLoadSuccess());
      } else {
        emit(HomeFailure(message: "Error al cargar los datos"));
      }
    });

    on<HomeLoginRequested>((event, emit) async {
      emit(HomeLoadInProgress());
      try {
        final url = Uri.parse(
          'https://run.mocky.io/v3/392d4730-cab5-4700-8b6d-af4a528a2ac3',
        );
        final res = await http.get(url);
        if (res.statusCode != 200) {
          emit(HomeFailure(message: 'Error al conectar con el servidor'));
          return;
        }

        final usuarios = json.decode(res.body) as List;
        final user = usuarios.firstWhere(
          (u) =>
              u['nombre_usuario'] == event.username.trim() &&
              u['password'] == event.password.trim(),
          orElse: () => null,
        );

        if (user != null) {
          emit(HomeLoadSuccess());
        } else {
          emit(
            HomeFailure(message: 'Nombre de usuario o contraseña incorrectos'),
          );
        }
      } catch (e) {
        emit(HomeFailure(message: 'Error: $e'));
      }
    });
  }
}
