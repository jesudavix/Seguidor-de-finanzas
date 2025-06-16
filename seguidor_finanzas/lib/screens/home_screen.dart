import 'package:flutter/material.dart';
import 'package:seguidor_finanzas/blocs/bloc/home_bloc.dart';
import 'package:seguidor_finanzas/blocs/bloc/selected_transaccion_type_bloc.dart';
import 'package:seguidor_finanzas/screens/login.dart';
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
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeInitial) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadSuccess) {
                return AppBarHomeScreen(nombre: state.nombreUsuario);
              } else {
                return SizedBox.shrink();
              }
            },
          ),
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
                  child: FractionallySizedBox(
                    heightFactor: 0.65,
                    child: AgregarTransaction()
                  ),
                );
              },
            );
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
