part of 'selected_transaccion_type_bloc.dart';

enum TipoTransaccion { ingreso, gasto }

abstract class SelectedTransaccionTypeState extends Equatable {}

final class TipoTransaccionEstado extends SelectedTransaccionTypeState {
  final TipoTransaccion tipoSeleccionado;

  TipoTransaccionEstado({required this.tipoSeleccionado});

  @override
  List<Object> get props => [tipoSeleccionado];
}
