import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/ui/styles/button_style.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      color: ColorsConstants.primaryColor,
    ),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: ColorsConstants.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsConstants.primaryColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorsConstants.secondaryColor,
      ),
    ),
    primaryColor: ColorsConstants.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsConstants.primaryColor,
      primary: ColorsConstants.primaryColor,
      secondary: ColorsConstants.secondaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: BtnStyle.instance.elevatedButtonStyle,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: BtnStyle.instance.outlinedButtonStyle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.only(left: 15, top: 13, bottom: 13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TxtStyle.instance.textRegular.copyWith(
        color: ColorsConstants.textColor,
      ),
      errorStyle: TxtStyle.instance.textRegular.copyWith(
        color: Colors.redAccent,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsConstants.primaryColor,
      elevation: 0,
      selectedLabelStyle: TextStyle(
        overflow: TextOverflow.clip,
      ),
      unselectedLabelStyle: TextStyle(
        overflow: TextOverflow.clip,
      ),
      selectedItemColor: ColorsConstants.secondaryColor,
      unselectedItemColor: ColorsConstants.textColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
