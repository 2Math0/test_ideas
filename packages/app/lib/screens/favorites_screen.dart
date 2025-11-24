import '../common_libs.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(AppSpacingValues.cozy),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledText(
                  'Favorites',
                  style: Style(
                    $text.style.fontSize(32),
                    $text.style.fontWeight.bold(),
                    $text.style.color.ref(AppColorTokens.wine),
                  ),
                ),
                const SizedBox(height: AppSpacingValues.compact),
                StyledText(
                  'Your saved items',
                  style: Style(
                    $text.style.fontSize(16),
                    $text.style.color.ref(AppColorTokens.slate),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacingValues.cozy,
          ),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppSpacingValues.cozy,
              mainAxisSpacing: AppSpacingValues.cozy,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return GlassCard(
                  onTap: () => debugPrint('Favorite $index tapped'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        color: AppColorValues.wine,
                        size: 48,
                      ),
                      const SizedBox(height: AppSpacingValues.compact),
                      StyledText(
                        'Item ${index + 1}',
                        style: Style(
                          $text.style.fontSize(16),
                          $text.style.fontWeight.w600(),
                          $text.style.color.ref(AppColorTokens.charcoal),
                        ),
                      ),
                      const SizedBox(height: AppSpacingValues.tiny),
                      StyledText(
                        'Favorite',
                        style: Style(
                          $text.style.fontSize(12),
                          $text.style.color.ref(AppColorTokens.slate),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 6,
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: AppSpacingValues.comfortable),
        ),
      ],
    );
  }
}