import 'package:flutter/material.dart';
import 'package:seguidor_finanzas/styles/colors.dart';
import 'package:seguidor_finanzas/styles/text_style.dart';

class AppBarHomeScreen extends StatelessWidget {
  const AppBarHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      actions: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Icon(
            Icons.settings,
            color: AppColors.settingIcon,
            size: 30,
          ),
        ),
      ],
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hola Juan, ", style: AppTextStyle.textTitleAppBar),
              SizedBox(height: 4),
              Text(
                "¿Que transaccion deseas agregar hoy?",
                style: AppTextStyle.textSubTitleAppBar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}