import '../../common_libs.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool elevated;

  const GlassCard({
    super.key,
    required this.child,
    this.onTap,
    this.elevated = true,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Define the common styles that apply to both states
    final baseStyle = Style(
      $box.color.ref(AppColorTokens.paper),
      $box.borderRadius.all.ref(AppRadiusTokens.curved),
      $box.padding.all.ref(AppSpacingTokens.cozy),
    );

    // 2. Define the conditional style
    final elevationStyle = elevated
        ? Style(
            $box.shadow.color(Colors.black26),
            $box.shadow.offset(0, 4),
            $box.shadow.blurRadius(8),
          )
        : Style(
            $box.border.color.ref(AppColorTokens.fog),
            $box.border.width(1),
          );

    // 3. Merge them together
    // (The right-side style overrides the left-side if there are conflicts,
    // and adds to it if there are new attributes)
    final finalStyle = baseStyle.merge(elevationStyle);

    return Box(
      style: finalStyle,
      child: onTap != null
          ? GestureDetector(onTap: onTap, child: child)
          : child,
    );
  }
}
