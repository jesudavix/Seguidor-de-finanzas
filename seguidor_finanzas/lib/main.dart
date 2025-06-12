import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seguidor_finanzas/blocs/bloc/home_bloc.dart';
import 'package:seguidor_finanzas/blocs/bloc/selected_transaccion_type_bloc.dart';
import 'package:seguidor_finanzas/blocs/bloc/transaccion_agg_bloc.dart';
import 'package:seguidor_finanzas/screens/home_screen.dart';
import 'package:seguidor_finanzas/screens/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectedTransaccionTypeBloc()),
        BlocProvider(create: (context) => TransaccionAggBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppRouter(),
      ),
    );
  }
}

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadSuccess) {
          return const HomeScreen(); // Usuario autenticado
        } else {
          return const LoginScreen(); // Por defecto, Login
        }
      },
    );
  }
}
