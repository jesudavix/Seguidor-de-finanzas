import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seguidor_finanzas/blocs/bloc/selected_transaccion_type_bloc.dart';
import 'package:seguidor_finanzas/blocs/bloc/transaccion_agg_bloc.dart';
import 'package:seguidor_finanzas/models/transaccion.dart';
import 'package:seguidor_finanzas/styles/text_style.dart';

class AgregarTransaction extends StatelessWidget {
  final _descripcionController = TextEditingController();
  final _montoController = TextEditingController();

  AgregarTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 12,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(3),
            ),
            height: 6,
            width: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Nueva Transaccion",
              style: AppTextStyle.textTitleTransaccionList,
            ),
          ),
          BlocBuilder<
            SelectedTransaccionTypeBloc,
            SelectedTransaccionTypeState
          >(
            builder: (context, state) {
              final tipoSeleccionado =
                  (state as TipoTransaccionEstado).tipoSeleccionado;
              return CupertinoSlidingSegmentedControl(
                groupValue: tipoSeleccionado,
                children: {
                  TipoTransaccion.ingreso: Text("Ingreso"),
                  TipoTransaccion.gasto: Text("Gasto"),
                },
                onValueChanged: (value) {
                  if (value != null) {
                    context.read<SelectedTransaccionTypeBloc>().add(
                      CambiarTipoTransaccion(nuevoTipo: value),
                    );
                  }
                },
              );
            },
          ),
          SizedBox(height: 20),
          Text("Monto", style: AppTextStyle.textTitleMonto),
          TextField(
            controller: _montoController,
            inputFormatters: [
              CurrencyTextInputFormatter.currency(symbol: "\$"),
            ],
            textAlign: TextAlign.center,
            decoration: InputDecoration.collapsed(
              hintText: "\$ 0.00",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(height: 20),
          Text("Descripcion", style: AppTextStyle.textTitleDescripcion),
          TextField(
            controller: _descripcionController,
            textAlign: TextAlign.center,
            decoration: InputDecoration.collapsed(
              hintText: "Ingresa una descripcion aqui",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                final descripcion = _descripcionController.text.trim();
                final montoStr =
                    _montoController.text
                        .replaceAll("\$", "")
                        .replaceAll(",", "")
                        .trim();
                final monto = double.tryParse(montoStr);
                if (descripcion.isNotEmpty && monto != null) {
                  final tipo =
                      context.read<SelectedTransaccionTypeBloc>().state;
                  context.read<TransaccionAggBloc>().add(
                    AgregarTransaccion(
                      transaccion: Transaccion(
                        tipo:
                            tipo.tipoSeleccionado == TipoTransaccion.ingreso
                                ? TransaccionType.ingreso
                                : TransaccionType.gasto,
                        descripcion: descripcion,
                        monto: monto,
                      ),
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: Text(
                "Agregar Transaccion",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
