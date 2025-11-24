import '../common_libs.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext con$text) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacingValues.cozy),
      children: [
        StyledText(
          'Explore',
          style: Style(
            $text.style.fontSize(32),
            $text.style.fontWeight.bold(),
            $text.style.color.ref(AppColorTokens.wine),
          ),
        ),
        const SizedBox(height: AppSpacingValues.comfortable),
        ...List.generate(
          5,
              (index) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacingValues.cozy),
            child: GlassCard(
              onTap: () => debugPrint('Card $index tapped'),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? AppColorValues.wine.withOpacity(0.1)
                          : AppColorValues.gold.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                        AppRadiusValues.smooth.x,
                      ),
                    ),
                    child: Icon(
                      _getIcon(index),
                      color: index.isEven
                          ? AppColorValues.wine
                          : AppColorValues.gold,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: AppSpacingValues.cozy),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledText(
                          'Item ${index + 1}',
                          style: Style(
                            $text.style.fontSize(18),
                            $text.style.fontWeight.w600(),
                            $text.style.color.ref(AppColorTokens.charcoal),
                          ),
                        ),
                        const SizedBox(height: AppSpacingValues.tiny),
                        StyledText(
                          'Explore this amazing item',
                          style: Style(
                            $text.style.fontSize(14),
                            $text.style.color.ref(AppColorTokens.slate),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: AppColorValues.fog,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  IconData _getIcon(int index) {
    final icons = [
      Icons.lightbulb_outline_rounded,
      Icons.rocket_launch_rounded,
      Icons.auto_awesome_rounded,
      Icons.psychology_rounded,
      Icons.emoji_objects_rounded,
    ];
    return icons[index % icons.length];
  }
}