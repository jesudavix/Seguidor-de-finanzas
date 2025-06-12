import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seguidor_finanzas/blocs/bloc/selected_transaccion_type_bloc.dart';
import 'package:seguidor_finanzas/styles/text_style.dart';

class AgregarTransaction extends StatelessWidget {
  const AgregarTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
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
            inputFormatters: [
              CurrencyTextInputFormatter.currency(symbol: "\$"),
            ],
            textAlign: TextAlign.center,
            decoration: InputDecoration.collapsed(
              hintText: "\$ 0.00",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: TextInputType.number,
            autofocus: true,
          ),
          SizedBox(height: 20),
          Text("Descripcion", style: AppTextStyle.textTitleDescripcion),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration.collapsed(
              hintText: "Ingresa una descripcion aqui",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {},
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
