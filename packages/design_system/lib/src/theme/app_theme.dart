import '../../common_libs.dart';

/// Creates the app Mix theme with wine/burgundy color scheme
MixThemeData createAppTheme() {
  return MixThemeData(
    colors: {
      AppColorTokens.wine: AppColorValues.wine,
      AppColorTokens.wineDark: AppColorValues.wineDark,
      AppColorTokens.wineLight: AppColorValues.wineLight,
      AppColorTokens.gold: AppColorValues.gold,
      AppColorTokens.goldLight: AppColorValues.goldLight,
      AppColorTokens.cloud: AppColorValues.cloud,
      AppColorTokens.mist: AppColorValues.mist,
      AppColorTokens.fog: AppColorValues.fog,
      AppColorTokens.slate: AppColorValues.slate,
      AppColorTokens.charcoal: AppColorValues.charcoal,
      AppColorTokens.paper: AppColorValues.paper,
      AppColorTokens.canvas: AppColorValues.canvas,
      AppColorTokens.ink: AppColorValues.ink,
      AppColorTokens.snow: AppColorValues.snow,
      AppColorTokens.emerald: AppColorValues.emerald,
      AppColorTokens.ruby: AppColorValues.ruby,
      AppColorTokens.amber: AppColorValues.amber,
    },
    radii: {
      AppRadiusTokens.sharp: AppRadiusValues.sharp,
      AppRadiusTokens.soft: AppRadiusValues.soft,
      AppRadiusTokens.smooth: AppRadiusValues.smooth,
      AppRadiusTokens.curved: AppRadiusValues.curved,
      AppRadiusTokens.round: AppRadiusValues.round,
      AppRadiusTokens.pill: AppRadiusValues.pill,
    },
    spaces: {
      AppSpacingTokens.none: AppSpacingValues.none,
      AppSpacingTokens.tiny: AppSpacingValues.tiny,
      AppSpacingTokens.compact: AppSpacingValues.compact,
      AppSpacingTokens.cozy: AppSpacingValues.cozy,
      AppSpacingTokens.comfortable: AppSpacingValues.comfortable,
      AppSpacingTokens.spacious: AppSpacingValues.spacious,
      AppSpacingTokens.expansive: AppSpacingValues.expansive,
    },
  );
}