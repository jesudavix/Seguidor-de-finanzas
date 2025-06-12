import 'package:flutter/material.dart';
import 'package:seguidor_finanzas/styles/colors.dart';

class AppTextStyle {
  static const TextStyle textTitleAppBar = TextStyle(
    color: AppColors.textColorPrimary,
    fontWeight: FontWeight.w600,
    fontSize: 25
  );

   static TextStyle textTitle = TextStyle(
    // ignore: deprecated_member_use
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.bold,
    fontSize: 15
  );

  static const TextStyle textAmountBalance = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 38
  );

  static TextStyle textSubTitleAppBar = TextStyle(
    color: AppColors.secondaryText,
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );

  static const TextStyle textTitleTransaccionList = TextStyle(
    color: Colors.teal,
    fontWeight: FontWeight.w600,
    fontSize: 20
  );

  static const TextStyle textTitleMonto = TextStyle(
    color: Colors.teal,
    fontSize: 18
  );

  static const TextStyle textTitleDescripcion = TextStyle(
    color: Colors.teal,
    fontSize: 18
  );
}