part of 'transaccion_agg_bloc.dart';


abstract class TransaccionAggEvent extends Equatable {
  const TransaccionAggEvent();

  @override
  List<Object> get props => [];
}

class AgregarTransaccion extends TransaccionAggEvent{
  final Transaccion transaccion;

   const AgregarTransaccion({ required this.transaccion});

  @override
  List<Object> get props => [transaccion];
}