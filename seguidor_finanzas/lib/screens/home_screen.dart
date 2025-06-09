import 'package:flutter/material.dart';
import 'package:seguidor_finanzas/styles/colors.dart';
import 'package:seguidor_finanzas/widgets/appbar_home_screen.dart';
import 'package:seguidor_finanzas/widgets/header_home_screen.dart';

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
      body: Column(
        children: [
          HeaderHomeScreen(),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.bodyTransationList,
            ),
          ),
        ],
      ),
    );
  }
}
