import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_transaccion_type_event.dart';
part 'selected_transaccion_type_state.dart';

class SelectedTransaccionTypeBloc
    extends Bloc<CambiarTipoTransaccion, TipoTransaccionEstado> {
  SelectedTransaccionTypeBloc()
    : super(TipoTransaccionEstado(tipoSeleccionado: TipoTransaccion.ingreso)) {
    on<CambiarTipoTransaccion>((event, emit) {
      emit(TipoTransaccionEstado(tipoSeleccionado: event.nuevoTipo));
    });
  }
}
