import 'dart:ui';
import 'package:mix/mix.dart';

/// Radius tokens
class AppRadiusTokens {
  static const sharp = RadiusToken('radius.sharp');
  static const soft = RadiusToken('radius.soft');
  static const smooth = RadiusToken('radius.smooth');
  static const curved = RadiusToken('radius.curved');
  static const round = RadiusToken('radius.round');
  static const pill = RadiusToken('radius.pill');
}

/// Radius values
class AppRadiusValues {
  static const sharp = Radius.circular(0);
  static const soft = Radius.circular(4);
  static const smooth = Radius.circular(8);
  static const curved = Radius.circular(16);
  static const round = Radius.circular(24);
  static const pill = Radius.circular(9999);
}