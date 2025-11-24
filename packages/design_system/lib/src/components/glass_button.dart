import '../../common_libs.dart';

enum ButtonVariant { wine, gold, ghost }

class GlassButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final IconData? icon;

  const GlassButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.wine,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // Note: We don't need 'isEnabled' boolean for styling anymore.
    // PressableBox handles the disabled state logic automatically.
    final isEnabled = onPressed != null;

    final baseStyle = Style(
      $box.height(48),
      $box.padding.horizontal.ref(AppSpacingTokens.comfortable),
      $box.borderRadius.all.ref(AppRadiusTokens.smooth),
      $flex.mainAxisAlignment.center(),
      $flex.crossAxisAlignment.center(),
      $flex.gap.ref(AppSpacingTokens.compact),
    );

    final variantStyle = switch (variant) {
      ButtonVariant.wine => Style(
        $box.color.ref(AppColorTokens.wine),
        $text.style.color.ref(AppColorTokens.snow),
        $text.style.fontWeight.w600(),
        // Use $on.disabled instead of 'if'
        $on.disabled(
          $box.color.ref(AppColorTokens.fog),
        ),
      ),
      ButtonVariant.gold => Style(
        $box.color.ref(AppColorTokens.gold),
        $text.style.color.ref(AppColorTokens.charcoal),
        $text.style.fontWeight.w600(),
        // Use $on.disabled instead of 'if'
        $on.disabled(
          $box.color.ref(AppColorTokens.fog),
        ),
      ),
      ButtonVariant.ghost => Style(
        $box.color.transparent(),
        $box.border.all.width(2),
        // Default state
        $box.border.all.color.ref(AppColorTokens.wine),
        $text.style.color.ref(AppColorTokens.wine),
        $text.style.fontWeight.w600(),
        // Disabled state (Overrides the defaults above)
        $on.disabled(
          $box.border.all.color.ref(AppColorTokens.fog),
          $text.style.color.ref(AppColorTokens.fog),
        ),
      ),
    };

    return PressableBox(
      // If this is null, PressableBox activates $on.disabled
      onPress: isEnabled ? onPressed : null,
      child: HBox(
        style: baseStyle.merge(variantStyle),
        children: [
          if (icon != null) Icon(icon, size: 20),
          StyledText(text),
        ],
      ),
    );
  }
}