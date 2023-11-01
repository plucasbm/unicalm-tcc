import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';

class TxtStyle {
  static TxtStyle? _instance;

  TxtStyle._();

  static TxtStyle get instance {
    _instance ??= TxtStyle._();
    return _instance!;
  }

  String get titleFont => FontConstants.titleFamily;
  String get textFont => FontConstants.textFamily;

  TextStyle get titleRegular => TextStyle(
    fontFamily: titleFont,
    fontWeight: FontWeight.w400,
    color: ColorsConstants.textColor,
  );

  TextStyle get textRegular => TextStyle(
    fontFamily: textFont,
    fontWeight: FontWeight.w400,
    color: ColorsConstants.textColor,
  );

  TextStyle get textBold => TextStyle(
    fontFamily: textFont,
    fontWeight: FontWeight.w700,
    color: ColorsConstants.textColor,
  );

  TextStyle get titleTextStyle => titleRegular.copyWith(
    fontSize: 28,
    color: ColorsConstants.secondaryColor,
  );

  TextStyle get buttonTextStyle => titleRegular.copyWith(
    fontSize: 18,
    letterSpacing: 2,
    fontWeight: FontWeight.bold,
    color: ColorsConstants.secondaryColor,
  );

  TextStyle get textRegular24 => textRegular.copyWith(
    fontSize: 24,
  );

  TextStyle get textRegular16 => textRegular.copyWith(
    fontSize: 16,
  );

  TextStyle get textBold16 => textBold.copyWith(
    fontSize: 16,
  );

}

 extension TxtStyleExtension on BuildContext {
  TxtStyle get txtStyle => TxtStyle.instance;
 }