import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class BtnStyle {
  static BtnStyle? _instance;

  BtnStyle._();

  static BtnStyle get instance {
    _instance ??= BtnStyle._();
    return _instance!;
  }

  ButtonStyle get outlinedButtonStyle => OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    side: const BorderSide(
      width: 3,
      color: ColorsConstants.secondaryColor,
    ),
    fixedSize: const Size(240, 40),
    backgroundColor: Colors.transparent,
    textStyle: TxtStyle.instance.buttonTextStyle,
  );

  ButtonStyle get elevatedButtonStyle => ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    fixedSize: const Size(240, 40),
    foregroundColor: ColorsConstants.secondaryColor, 
    backgroundColor: ColorsConstants.primaryColor,
    textStyle: TxtStyle.instance.buttonTextStyle,
    elevation: 0,
  );
}

extension BtnStyleExtension on BuildContext {
  BtnStyle get btnStyle => BtnStyle.instance;
}