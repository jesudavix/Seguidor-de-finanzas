import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingDollar(),
              SizedBox(height: 40),
              LoadingText(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingDollar extends StatelessWidget {
  const LoadingDollar({super.key});

  @override
  Widget build(BuildContext context) {
    return _RotatingDollar();
  }
}

class _RotatingDollar extends StatelessWidget {
  const _RotatingDollar();

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(seconds: 2),
      onEnd: () {},
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value * 3 * 3.1416,
          child: child,
        );
      },
      child: const Text(
        '\$',
        style: TextStyle(
          fontSize: 200,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 207, 177, 4),
        ),
      ),
    );
  }
}

class LoadingText extends StatelessWidget {
  const LoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: Stream.periodic(const Duration(milliseconds: 500), (count) => count % 4),
      builder: (context, snapshot) {
        final dotCount = snapshot.data ?? 0;
        final dots = '.' * dotCount;
        return Text(
          'Cargando$dots',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 207, 177, 4),
          ),
        );
      },
    );
  }
}
