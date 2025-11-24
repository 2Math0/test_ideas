import 'dart:ui';

import 'package:mix/mix.dart';

/// Color tokens using actual color names
class AppColorTokens {
  // Wine/Burgundy shades
  static const wine = ColorToken('color.wine');
  static const wineDark = ColorToken('color.wine.dark');
  static const wineLight = ColorToken('color.wine.light');

  // Gold shades
  static const gold = ColorToken('color.gold');
  static const goldLight = ColorToken('color.gold.light');

  // Neutral grays
  static const cloud = ColorToken('color.cloud');
  static const mist = ColorToken('color.mist');
  static const fog = ColorToken('color.fog');
  static const slate = ColorToken('color.slate');
  static const charcoal = ColorToken('color.charcoal');

  // Surface colors
  static const paper = ColorToken('color.paper');
  static const canvas = ColorToken('color.canvas');
  static const ink = ColorToken('color.ink');
  static const snow = ColorToken('color.snow');

  // Status colors
  static const emerald = ColorToken('color.emerald');
  static const ruby = ColorToken('color.ruby');
  static const amber = ColorToken('color.amber');
}

/// Color values
class AppColorValues {
  // Burgundy wine color as main brand color
  static const wine = Color(0xFF800020);
  static const wineDark = Color(0xFF5C0015);
  static const wineLight = Color(0xFFB8154F);

  // Gold accent
  static const gold = Color(0xFFD4AF37);
  static const goldLight = Color(0xFFE8D4A0);

  // Neutrals
  static const cloud = Color(0xFFF5F5F5);
  static const mist = Color(0xFFEEEEEE);
  static const fog = Color(0xFFE0E0E0);
  static const slate = Color(0xFF424242);
  static const charcoal = Color(0xFF212121);

  // Surfaces
  static const paper = Color(0xFFFFFFFF);
  static const canvas = Color(0xFFFAF9F8);
  static const ink = Color(0xFF212121);
  static const snow = Color(0xFFFFFFFF);

  // Status
  static const emerald = Color(0xFF4CAF50);
  static const ruby = Color(0xFFE53935);
  static const amber = Color(0xFFFFA726);
}