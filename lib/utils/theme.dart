import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class Facilpme {
  // Construtor privado para impedir a instanciação da classe.
  Facilpme._();

  // Tema claro padrão.
  static ThemeData _theme = _buildLightTheme();

  // Tema escuro padrão.
  static ThemeData _darkTheme = _buildDarkTheme();

  // Constrói o tema claro.
  static ThemeData _buildLightTheme() {
    return FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color(0xff00296b),
        primaryContainer: Color(0xffa0c2ed),
        secondary: Color(0xffd26900),
        secondaryContainer: Color(0xffffd270),
        tertiary: Color(0xff5c5c95),
        tertiaryContainer: Color(0xffc8dbf8),
        appBarColor: Color(0xffc8dcf8),
        error: null,
      ),
      usedColors: 7,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: false,
    );
  }

  // Constrói o tema escuro.
  static ThemeData _buildDarkTheme() {
    return FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: Color(0xff00296b),
        primaryContainer: Color(0xffa0c2ed),
        secondary: Color(0xffd26900),
        secondaryContainer: Color(0xffffd270),
        tertiary: Color(0xff5c5c95),
        tertiaryContainer: Color(0xffc8dbf8),
        appBarColor: Color(0xffc8dcf8),
        error: null,
      ).defaultError.toDark(6, true),
      usedColors: 7,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      swapColors: true,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendTextTheme: true,
        useTextTheme: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: false,
    );
  }

  // Retorna o tema claro.
  static ThemeData get theme => _theme;

  // Retorna o tema escuro.
  static ThemeData get darkTheme => _darkTheme;
}
