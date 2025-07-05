import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color? color) {
  return TextStyle(
    // fontFamily: FontConstants.fontCabinFamily,
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle getRegularStyle({
  required double fontSize,
  Color? color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}

TextStyle getMessageStyle({
  required double fontSize,
  Color? color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
  );
}

TextStyle getMediumStyle({
  required double fontSize,
  Color? color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}

TextStyle getBoldStyle({
  required double fontSize,
  Color? color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
  );
}

TextStyle getSemiBoldStyle({
  required double fontSize,
  Color? color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
  );
}

TextStyle getLightStyle({
  required double fontSize,
  Color? color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
  );
}
