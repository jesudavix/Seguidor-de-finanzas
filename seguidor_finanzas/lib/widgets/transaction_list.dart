import 'package:flutter/material.dart';
import 'package:seguidor_finanzas/styles/colors.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: AppColors.bodyTransationList),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.attach_money_sharp, color: Colors.green),
              title: Text("Ingreso"),
              subtitle: Text("Salary"),
              trailing: Text("\$ 1,000.00", style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              leading: Icon(Icons.money_off, color: Colors.red),
              title: Text("Gasto"),
              subtitle: Text("Gasolina"),
              trailing: Text("- \$ 500.00", style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
