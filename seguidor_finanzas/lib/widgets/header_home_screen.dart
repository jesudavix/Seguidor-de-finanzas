import 'package:flutter/material.dart';
import 'package:seguidor_finanzas/components/card_ingreso_gasto.dart';
import 'package:seguidor_finanzas/styles/text_style.dart';

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text("Balance:", style: AppTextStyle.textTitle),
          Text("\$ 1,000.00", style: AppTextStyle.textAmountBalance),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CardHomeScreen(
                  name: "Ingreso",
                  iconCard: Icon(Icons.attach_money_sharp, color: Colors.green),
                  monto: 1000.00,
                ),
                SizedBox(width: 12,),
                CardHomeScreen(
                  name: "Gasto",
                  iconCard: Icon(Icons.money_off, color: Colors.red),
                  monto: -500.00,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}