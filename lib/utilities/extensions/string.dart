import 'package:flutter/material.dart';

extension StringHardcoded on String {
  String get hardcoded => this;
}

extension StringCapalizeEveryFirstLetter on String {
  String get capsEveryFirstLetter => split(' ').map((e) => e[0].toUpperCase()+e.substring(1)).join(' ');
}

extension StringColor on String {
  Color get color => Color(int.parse('0xFF${replaceAll('#', '')}'));
}