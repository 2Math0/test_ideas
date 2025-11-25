import '../../common_libs.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';


class FakeGlassBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final List<NavBarItem> items;

  const FakeGlassBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          // Background
          // Positioned.fill(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           AppColorValues.wine.withValues(alpha: 0.1),
          //           AppColorValues.gold.withValues(alpha: 0.05),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          // Fake glass (better performance)
          Positioned.fill(
            child: FakeGlass(
              shape: const LiquidRoundedRectangle(borderRadius: 0),
              settings: const LiquidGlassSettings(
                blur: 10,
                glassColor: Color(0x44FFFFFF),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColorValues.paper.withValues(alpha: 0.6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Positioned.fill(
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isSelected = index == selectedIndex;

                  return Expanded(
                    child: _NavBarItem(
                      icon: item.icon,
                      label: item.label,
                      isSelected: isSelected,
                      onTap: () => onTap(index),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      onPress: onTap,
      child: VBox(
        style: Style(
          $flex.mainAxisAlignment.center(),
          $flex.crossAxisAlignment.center(),
          $flex.gap.ref(AppSpacingTokens.tiny),
        ),
        children: [
          Icon(
            icon,
            color: isSelected ? AppColorValues.wine : AppColorValues.slate,
            size: 24,
          ),
          StyledText(
            label,
            style: Style(
              $text.style.fontSize(12),
              $text.style.fontWeight(
                isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              $text.style.color.ref(
                isSelected ? AppColorTokens.wine : AppColorTokens.slate,
              ),
            ),
          ),
        ],
      ),
    );
  }
}