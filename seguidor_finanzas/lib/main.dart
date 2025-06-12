import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seguidor_finanzas/bloc/home_bloc.dart';
import 'package:seguidor_finanzas/screens/home_failuri.dart';
import 'package:seguidor_finanzas/screens/home_screen.dart';
import 'package:seguidor_finanzas/screens/login.dart';
import 'package:seguidor_finanzas/screens/Loadin_sceen_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadSuccess) {
              return const HomeScreen();
            } else if (state is HomeLoadInProgress) {
              return const LoadingScreenState();
            } else if (state is HomeFailure) {
              return const HomeFalla(); 
            }
            return const LoginScreen(); 
          },
        ),
      ),
    );
  }
}
