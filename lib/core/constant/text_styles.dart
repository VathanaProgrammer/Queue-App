import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static const TextStyle splashtitle = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  // title
  static const TextStyle _baseTitle = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
 // can customize
  // AppTextStyles.title(
  //     color: Colors.red,
  //   ),
  static TextStyle title({Color? color, double? fontSize}) {
    return _baseTitle.copyWith(
      color: color,
      fontSize: fontSize,
    );
  }

  static const TextStyle subtitle = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
}