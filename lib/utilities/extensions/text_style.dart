import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension Styles on TextStyle{
  TextStyle get thinStyle => GoogleFonts.roboto(fontWeight: FontWeight.w100);
  TextStyle get extraLightStyle => GoogleFonts.roboto(fontWeight: FontWeight.w200);
  TextStyle get lightStyle => GoogleFonts.roboto(fontWeight: FontWeight.w300);
  TextStyle get regularStyle => GoogleFonts.roboto(fontWeight: FontWeight.w400);
  TextStyle get mediumStyle => GoogleFonts.roboto(fontWeight: FontWeight.w500);
  TextStyle get semiBoldStyle => GoogleFonts.roboto(fontWeight: FontWeight.w600);
  TextStyle get boldStyle => GoogleFonts.roboto(fontWeight: FontWeight.w700);
  TextStyle get extraBoldStyle => GoogleFonts.roboto(fontWeight: FontWeight.w800);
  TextStyle get thickStyle => GoogleFonts.roboto(fontWeight: FontWeight.w900);
}