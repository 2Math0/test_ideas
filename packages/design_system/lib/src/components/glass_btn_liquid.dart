import '../../common_libs.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

enum GlassButtonVariant { wine, gold, ghost }

class GlassButtonLiquid extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final GlassButtonVariant variant;
  final IconData? icon;
  final bool useFakeGlass;

  const GlassButtonLiquid({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = GlassButtonVariant.wine,
    this.icon,
    this.useFakeGlass = false,
  });

  @override
  State<GlassButtonLiquid> createState() => _GlassButtonLiquidState();
}

class _GlassButtonLiquidState extends State<GlassButtonLiquid> {
  // bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null;

    if (!isEnabled) {
      return _buildDisabledButton();
    }

    return GestureDetector(
      // onTapDown: (_) => setState(() => _isPressed = true),
      // onTapUp: (_) {
      //   setState(() => _isPressed = false);
      //   widget.onPressed?.call();
      // },
      // onTapCancel: () => setState(() => _isPressed = false),
      child: SizedBox(
        height: 56,
        child: Stack(
          children: [
            // 1. Background gradient
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: _getGradient(),
                  borderRadius: BorderRadius.circular(
                    AppRadiusValues.smooth.x,
                  ),
                ),
              ),
            ),

            // 2. Glass effect
            Positioned.fill(
              child: widget.useFakeGlass
                  ? _buildFakeGlass()
                  : _buildRealGlass(),
            ),

            // 3. Content on top
            Positioned.fill(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRealGlass() {
    return LiquidGlassLayer(
      settings: LiquidGlassSettings(
        thickness: 12,
        blur: 8,
        glassColor: _getGlassColor(),
        lightIntensity: 1.5,
        saturation: 1.2,
      ),
      child: GlassGlow(
        // isPressed: _isPressed,
        glowColor: Colors.white24,
        glowRadius: 0.8,
        child: LiquidGlass(
          shape: LiquidRoundedSuperellipse(
            borderRadius: AppRadiusValues.smooth.x,
          ),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }

  Widget _buildFakeGlass() {
    return FakeGlass(
      shape: LiquidRoundedSuperellipse(
        borderRadius: AppRadiusValues.smooth.x,
      ),
      settings: LiquidGlassSettings(
        blur: 8,
        glassColor: _getGlassColor(),
      ),
      child: const SizedBox.expand(),
    );
  }

  Widget _buildContent() {
    return HBox(
      style: Style(
        $box.padding.horizontal.ref(AppSpacingTokens.comfortable),
        $flex.mainAxisAlignment.center(),
        $flex.crossAxisAlignment.center(),
        $flex.gap.ref(AppSpacingTokens.compact),
      ),
      children: [
        if (widget.icon != null)
          Icon(
            widget.icon,
            size: 20,
            color: _getTextColor(),
          ),
        StyledText(
          widget.text,
          style: Style(
            $text.style.fontSize(16),
            $text.style.fontWeight.w600(),
            $text.style.color(_getTextColor()),
          ),
        ),
      ],
    );
  }

  Widget _buildDisabledButton() {
    return HBox(
      style: Style(
        $box.height(56),
        $box.padding.horizontal.ref(AppSpacingTokens.comfortable),
        $box.borderRadius.all.ref(AppRadiusTokens.smooth),
        $box.color.ref(AppColorTokens.fog),
        $flex.mainAxisAlignment.center(),
        $flex.crossAxisAlignment.center(),
        $flex.gap.ref(AppSpacingTokens.compact),
      ),
      children: [
        if (widget.icon != null)
          Icon(
            widget.icon,
            size: 20,
            color: AppColorValues.slate,
          ),
        StyledText(
          widget.text,
          style: Style(
            $text.style.fontSize(16),
            $text.style.fontWeight.w600(),
            $text.style.color.ref(AppColorTokens.slate),
          ),
        ),
      ],
    );
  }

  LinearGradient _getGradient() {
    return switch (widget.variant) {
      GlassButtonVariant.wine => const LinearGradient(
        colors: [
          AppColorValues.wine,
          AppColorValues.wineDark,
        ],
      ),
      GlassButtonVariant.gold => LinearGradient(
        colors: [
          AppColorValues.gold,
          AppColorValues.gold.withValues(alpha: 0.8),
        ],
      ),
      GlassButtonVariant.ghost => LinearGradient(
        colors: [
          AppColorValues.wine.withValues(alpha: 0.1),
          AppColorValues.wine.withValues(alpha: 0.05),
        ],
      ),
    };
  }

  Color _getGlassColor() {
    return switch (widget.variant) {
      GlassButtonVariant.wine => const Color(0x33FFFFFF),
      GlassButtonVariant.gold => const Color(0x22FFFFFF),
      GlassButtonVariant.ghost => const Color(0x44FFFFFF),
    };
  }

  Color _getTextColor() {
    return switch (widget.variant) {
      GlassButtonVariant.wine => AppColorValues.snow,
      GlassButtonVariant.gold => AppColorValues.charcoal,
      GlassButtonVariant.ghost => AppColorValues.wine,
    };
  }
}