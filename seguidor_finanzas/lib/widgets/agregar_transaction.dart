import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seguidor_finanzas/styles/text_style.dart';

class AgregarTransaction extends StatelessWidget {
  const AgregarTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
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
          CupertinoSlidingSegmentedControl(
            groupValue: "Ingreso",
            children: {"Ingreso": Text("Ingreso"), "Gasto": Text("Gasto")},
            onValueChanged: (value) {
              print('Seleccionado: $value');
            },
          ),
        ],
      ),
    );
  }
}
