import 'package:flutter/material.dart';
import 'package:racemate/utilities/extensions/text_style.dart';

extension Spaces on num {
  SizedBox get vSpace => SizedBox(
    height: toDouble(),
  );

  SizedBox get hSpace => SizedBox(
    width: toDouble(),
  );
}

extension PaddingsExtension on num {
  EdgeInsets get allPadding => EdgeInsets.all(toDouble());
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get topPadding => EdgeInsets.only(top: toDouble());
  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get leftPadding => EdgeInsets.only(left: toDouble());
  EdgeInsets get rightPadding => EdgeInsets.only(right: toDouble());
  EdgeInsetsDirectional get startPadding => EdgeInsetsDirectional.only(start: toDouble());
  EdgeInsetsDirectional get endPadding => EdgeInsetsDirectional.only(end: toDouble());
}

extension CircularBorders on num {
  BorderRadius get allCircularBorder => BorderRadius.circular(toDouble());
  BorderRadius get hCircularBorder => BorderRadius.horizontal(left: Radius.circular(toDouble()), right: Radius.circular(toDouble()));
  BorderRadiusDirectional get hStartCircularBorder => BorderRadiusDirectional.horizontal(start: Radius.circular(toDouble()));
  BorderRadiusDirectional get hEndCircularBorder => BorderRadiusDirectional.horizontal(end: Radius.circular(toDouble()));

  BorderRadius get vCircularBorder => BorderRadius.vertical(top: Radius.circular(toDouble()), bottom: Radius.circular(toDouble()));
  BorderRadius get vTopCircularBorder => BorderRadius.vertical(top: Radius.circular(toDouble()));
  BorderRadius get vBottomCircularBorder => BorderRadius.vertical(bottom: Radius.circular(toDouble()));

  BorderRadius get topLeftCircularBorder => BorderRadius.only(topLeft: Radius.circular(toDouble()));
  BorderRadius get topRightCircularBorder => BorderRadius.only(topRight: Radius.circular(toDouble()));
  BorderRadius get bottomLeftCircularBorder => BorderRadius.only(bottomLeft: Radius.circular(toDouble()));
  BorderRadius get bottomRightCircularBorder => BorderRadius.only(bottomRight: Radius.circular(toDouble()));

  BorderRadiusDirectional get startCircularBorder => BorderRadiusDirectional.only(topStart: Radius.circular(toDouble()), bottomStart: Radius.circular(toDouble()));
  BorderRadiusDirectional get endCircularBorder => BorderRadiusDirectional.only(topEnd: Radius.circular(toDouble()), bottomEnd: Radius.circular(toDouble()));
}

extension TextStyles on num {
  TextStyle get thinStyle => const TextStyle().thinStyle.copyWith(fontSize: toDouble());
  TextStyle get extraLightStyle => const TextStyle().extraLightStyle.copyWith(fontSize: toDouble());
  TextStyle get lightStyle => const TextStyle().lightStyle.copyWith(fontSize: toDouble());
  TextStyle get regularStyle => const TextStyle().regularStyle.copyWith(fontSize: toDouble());
  TextStyle get mediumStyle => const TextStyle().mediumStyle.copyWith(fontSize: toDouble());
  TextStyle get semiBoldStyle => const TextStyle().semiBoldStyle.copyWith(fontSize: toDouble());
  TextStyle get boldStyle => const TextStyle().boldStyle.copyWith(fontSize: toDouble());
  TextStyle get extraBoldStyle => const TextStyle().extraBoldStyle.copyWith(fontSize: toDouble());
  TextStyle get thickStyle => const TextStyle().thickStyle.copyWith(fontSize: toDouble());
}