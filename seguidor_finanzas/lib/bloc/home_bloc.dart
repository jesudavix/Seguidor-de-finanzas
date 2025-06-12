import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
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
        emit(HomeFailure());
      }
    });
  }
}
