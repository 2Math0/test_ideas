import '../common_libs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacingValues.cozy),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        StyledText(
        'Test Ideas',
        style: Style(
          $text.style.fontSize(32),
          $text.style.fontWeight.bold(),
          $text.style.color.ref(AppColorTokens.wine),
        ),
      ),
      const SizedBox(height: AppSpacingValues.compact),
      StyledText(
        'Elegant design system proof of concept',
        style: Style(
          $text.style.fontSize(16),
          $text.style.color.ref(AppColorTokens.slate),
        ),
      ),
      const SizedBox(height: AppSpacingValues.comfortable),
      GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledText(
              'Mix Theme System',
              style: Style(
                $text.style.fontSize(20),
                $text.style.fontWeight.w600(),
                $text.style.color.ref(AppColorTokens.charcoal),
              ),
            ),
            const SizedBox(height: AppSpacingValues.compact),
            StyledText(
              'Custom tokens for colors, spacing, and radius. No dependency on Flutter Material theming.',
              style: Style(
                $text.style.color.ref(AppColorTokens.slate),
                $text.style.height(1.5),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: AppSpacingValues.cozy),
      GlassButton(
        text: 'Wine Action',
        icon: Icons.star_rounded,
        onPressed: () => debugPrint('Wine button pressed'),
      ),
      const SizedBox(height: AppSpacingValues.compact),
      GlassButton(
        text: 'Gold Action',
        variant: ButtonVariant.gold,
        icon: Icons.explore_rounded,
        onPressed: () => debugPrint('Gold button pressed'),
      ),
      const SizedBox(height: AppSpacingValues.compact),
      GlassButton(
        text: 'Ghost Action',
        variant: ButtonVariant.ghost,
        icon: Icons.info_outline_rounded,
        onPressed: () => debugPrint('Ghost button pressed'),
      ),
      const SizedBox(height: AppSpacingValues.comfortable),
      GlassCard(
        elevated: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Row(
        children: [
        Icon(
        Icons.palette_rounded,
          color: AppColorValues.wine,
          size: 24,
        ),
        const SizedBox(width: AppSpacingValues.compact),
        StyledText(
          'Color Palette',
          style: Style(
            $text.style.fontSize(18),
            $text.style.fontWeight.w600(),
            $text.style.color.ref(AppColorTokens.charcoal),
          ),
        ),
        ],
      ),
      const SizedBox(height: AppSpacingValues.cozy),
      _ColorSwatch(
        name: 'Wine',
        color: AppColorValues.wine,
        hex: '#800020',
      ),
      const SizedBox(height: AppSpacingValues.compact),
      _ColorSwatch(
        name: 'Gold',
        color: AppColorValues.gold,
        hex: '#D4AF37',
      ),
            const SizedBox(height: AppSpacingValues.compact),
            _ColorSwatch(
              name: 'Slate',
              color: AppColorValues.slate,
              hex: '#424242',
            ),
          ],
        ),
      ),
          const SizedBox(height: AppSpacingValues.cozy),
          GlassButton(
            text: 'Disabled Button',
            icon: Icons.block_rounded,
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final String name;
  final Color color;
  final String hex;

  const _ColorSwatch({
    required this.name,
    required this.color,
    required this.hex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppRadiusValues.smooth.x),
            border: Border.all(
              color: AppColorValues.fog,
              width: 1,
            ),
          ),
        ),
        const SizedBox(width: AppSpacingValues.compact),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledText(
              name,
              style: Style(
                $text.style.fontWeight.w600(),
                $text.style.color.ref(AppColorTokens.charcoal),
              ),
            ),
            StyledText(
              hex,
              style: Style(
                $text.style.fontSize(12),
                $text.style.color.ref(AppColorTokens.slate),
              ),
            ),
          ],
        ),
      ],
    );
  }
}