part of 'selected_transaccion_type_bloc.dart';

abstract class SelectedTransaccionTypeEvent extends Equatable {
  const SelectedTransaccionTypeEvent();

  @override
  List<Object> get props => [];
}

class CambiarTipoTransaccion extends SelectedTransaccionTypeEvent{

  final TipoTransaccion nuevoTipo;

  const CambiarTipoTransaccion({required this.nuevoTipo});

  @override
  List<Object> get props => [nuevoTipo];
}
