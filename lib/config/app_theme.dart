import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(0, 19, 126, 46);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor  = 0}):assert(selectColor >=0 && selectColor<=(_colorThemes.length-1),"Colors must be between 0 and ${_colorThemes.length}");

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectColor]
    );
  }
}