import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selected_transaccion_type_event.dart';
part 'selected_transaccion_type_state.dart';

class SelectedTransaccionTypeBloc extends Bloc<SelectedTransaccionTypeEvent, SelectedTransaccionTypeState> {
  SelectedTransaccionTypeBloc() : super(SelectedTransaccionTypeInitial()) {
    on<SelectedTransaccionTypeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
