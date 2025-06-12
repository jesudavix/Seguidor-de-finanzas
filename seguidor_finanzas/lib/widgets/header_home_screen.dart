import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seguidor_finanzas/blocs/bloc/transaccion_agg_bloc.dart';
import 'package:seguidor_finanzas/components/card_ingreso_gasto.dart';
import 'package:seguidor_finanzas/models/transaccion.dart';
import 'package:seguidor_finanzas/styles/text_style.dart';

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransaccionAggBloc, TransaccionAggState>(
      builder: (context, state) {
        if (state is TransaccionAggInitial) {
          final transacciones = state.transacciones;

          final totalIngresos = transacciones
              .where((t) => t.tipo == TransaccionType.ingreso)
              .fold(0.0, (sum, t) => sum + t.monto);

          final totalGastos = transacciones
              .where((t) => t.tipo == TransaccionType.gasto)
              .fold(0.0, (sum, t) => sum + t.monto);

          final balance = totalIngresos - totalGastos;

          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Text("Balance:", style: AppTextStyle.textTitle),
                Text(
                  "\$ ${balance.toStringAsFixed(2)}",
                  style: AppTextStyle.textAmountBalance,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      CardHomeScreen(
                        name: "Ingreso",
                        iconCard: Icon(
                          Icons.attach_money_sharp,
                          color: Colors.green,
                        ),
                        monto: totalIngresos,
                      ),
                      SizedBox(width: 12),
                      CardHomeScreen(
                        name: "Gasto",
                        iconCard: Icon(
                          Icons.money_off,
                          color: Colors.red,
                        ),
                        monto: totalGastos,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
