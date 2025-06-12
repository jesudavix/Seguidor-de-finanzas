import 'package:flutter/material.dart';
import 'package:seguidor_finanzas/blocs/bloc/selected_transaccion_type_bloc.dart';
import 'package:seguidor_finanzas/styles/colors.dart';
import 'package:seguidor_finanzas/widgets/agregar_transaction.dart';
import 'package:seguidor_finanzas/widgets/appbar_home_screen.dart';
import 'package:seguidor_finanzas/widgets/header_home_screen.dart';
import 'package:seguidor_finanzas/widgets/transaction_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarHomeScreen(),
      ),
      body: Column(children: [HeaderHomeScreen(), TransactionList()]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.background,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: context.read<SelectedTransaccionTypeBloc>(),
                child: AgregarTransaction(),
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
