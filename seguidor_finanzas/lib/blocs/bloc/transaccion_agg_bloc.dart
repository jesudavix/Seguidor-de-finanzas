import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seguidor_finanzas/models/transaccion.dart';

part 'transaccion_agg_event.dart';
part 'transaccion_agg_state.dart';

class TransaccionAggBloc
    extends Bloc<TransaccionAggEvent, TransaccionAggState> {
  TransaccionAggBloc() : super(TransaccionAggInitial.initial()) {
    on<AgregarTransaccion>((event, emit) {
      final currentState = state;

      if (currentState is TransaccionAggInitial) {
        final nuevas = List<Transaccion>.from(currentState.transacciones)
          ..add(event.transaccion);

        emit(currentState.copyWith(transacciones: nuevas));
      }
    });
  }
}
