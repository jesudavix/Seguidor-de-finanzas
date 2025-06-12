part of 'transaccion_agg_bloc.dart';

abstract class TransaccionAggState extends Equatable {}

class TransaccionAggInitial extends TransaccionAggState {
  final List<Transaccion> transacciones;

  TransaccionAggInitial({required this.transacciones});

  factory TransaccionAggInitial.initial() {
    return TransaccionAggInitial(transacciones: []);
  }

  TransaccionAggInitial copyWith({List<Transaccion>? transacciones}) {
    return TransaccionAggInitial(
      transacciones: transacciones ?? this.transacciones,
    );
  }

  @override
  List<Object> get props => [transacciones];
}
