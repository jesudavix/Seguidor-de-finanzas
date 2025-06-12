import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seguidor_finanzas/blocs/bloc/transaccion_agg_bloc.dart';
import 'package:seguidor_finanzas/models/transaccion.dart';
import 'package:seguidor_finanzas/styles/colors.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: AppColors.bodyTransationList),
        child: BlocBuilder<TransaccionAggBloc, TransaccionAggState>(
          builder: (context, state) {
            if (state is TransaccionAggInitial) {
              final transacciones = state.transacciones;

              if (transacciones.isEmpty) {
                return Center(child: Text("Sin transacciones aún"));
              }

              return ListView.builder(
                itemCount: transacciones.length,
                itemBuilder: (context, index) {
                  final transaccion = transacciones[index];
                  final esIngreso = transaccion.tipo == TransaccionType.ingreso;

                  return ListTile(
                    leading: Icon(
                      esIngreso ? Icons.attach_money_sharp : Icons.money_off,
                      color: esIngreso ? Colors.green : Colors.red,
                    ),
                    title: Text(esIngreso ? "Ingreso" : "Gasto"),
                    subtitle: Text(transaccion.descripcion),
                    trailing: Text(
                      "${esIngreso ? '' : '- '}\$ ${transaccion.monto.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
