import 'package:flutter/material.dart';

sealed class ImageConstants {
  static const fullLogo = 'assets/images/full_logo.png';
  static const dialog1 = 'assets/images/dialog1.png';
  static const dialog2 = 'assets/images/dialog2.png';
  static const dialog3 = 'assets/images/dialog3.png';
  static const logoCortada = 'assets/images/logo_cortada.png';
  static const quizDialog = 'assets/images/quiz-dialog.png';
}

sealed class ColorsConstants {
  static const backgroundColor = Color(0xFFEAEAEA);
  static const primaryColor = Color(0xFFBBE6A1);
  static const primaryColorAlpha = Color.fromARGB(64, 187, 230, 161);
  static const secondaryColor = Color(0xFF55067C);
  static const textColor = Color(0xFF333333);
}

sealed class FontConstants {
  static const textFamily = 'Poppins';
  static const titleFamily = 'Roboto';
}