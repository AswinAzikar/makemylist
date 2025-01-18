import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get adaptiveTextColor => Theme.of(this).brightness == Brightness.dark
      ? Colors.white
      : Colors.black;

  TextStyle baseTextStyle(String fontFamily, FontWeight fontWeight) {
    return TextStyle(
      decoration: TextDecoration.none,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: adaptiveTextColor,
    );
  }

  // Roboto Text Styles
  TextStyle get robotoRegular => baseTextStyle('Roboto', FontWeight.w400);
  TextStyle get robotoBold => baseTextStyle('Roboto', FontWeight.w700);
  TextStyle get robotoBlack => baseTextStyle('Roboto', FontWeight.w900);
  TextStyle get robotoLight => baseTextStyle('Roboto', FontWeight.w300);
  TextStyle get robotoThin => baseTextStyle('Roboto', FontWeight.w100);
  TextStyle get robotoSemiBold => baseTextStyle('Roboto', FontWeight.w600);

  TextStyle get robotoRegular12 => robotoRegular.copyWith(fontSize: 12);
  TextStyle get robotoRegular14 => robotoRegular.copyWith(fontSize: 14);
  TextStyle get robotoRegular16 => robotoRegular.copyWith(fontSize: 16);
  TextStyle get robotoSemiBold26 => robotoSemiBold.copyWith(fontSize: 26);
  TextStyle get robotoSemiBold12 => robotoSemiBold.copyWith(fontSize: 12);
  TextStyle get robotoBold18 => robotoBold.copyWith(fontSize: 18);
  TextStyle get robotoBold20 => robotoBold.copyWith(fontSize: 20);
  TextStyle get robotoBlack22 => robotoBlack.copyWith(fontSize: 22);
  TextStyle get robotoLight16 => robotoLight.copyWith(fontSize: 16);
  TextStyle get robotoThin14 => robotoThin.copyWith(fontSize: 14);
  TextStyle get robotoItalic18 =>
      robotoRegular.copyWith(fontSize: 18, fontStyle: FontStyle.italic);
  TextStyle get robotoBoldUnderlined16 =>
      robotoBold.copyWith(fontSize: 16, decoration: TextDecoration.underline);

  TextStyle get robotoRegular12Gray =>
      robotoRegular12.copyWith(color: Colors.grey);
  TextStyle get robotoMedium16 =>
      baseTextStyle('Roboto', FontWeight.w500).copyWith(fontSize: 16);
  TextStyle get robotoSemiBold20 =>
      baseTextStyle('Roboto', FontWeight.w600).copyWith(fontSize: 20);
  TextStyle get robotoExtraBold22 =>
      baseTextStyle('Roboto', FontWeight.w800).copyWith(fontSize: 22);
  TextStyle get robotoBoldItalic18 => baseTextStyle('Roboto', FontWeight.w700)
      .copyWith(fontSize: 18, fontStyle: FontStyle.italic);
  TextStyle get robotoUnderlined14 =>
      robotoRegular14.copyWith(decoration: TextDecoration.underline);

  TextStyle get headlineLarge => robotoBold.copyWith(fontSize: 32);
  TextStyle get bodySmall => robotoLight.copyWith(fontSize: 14);
  TextStyle get titleMedium => robotoMedium16.copyWith(fontSize: 20);
}
