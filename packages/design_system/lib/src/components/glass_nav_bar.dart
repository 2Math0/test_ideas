import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

import '../../common_libs.dart';

typedef NavBarItem = ({IconData icon, String label});

class GlassNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final List<NavBarItem> items;

  const GlassNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return LiquidGlassLayer(
      child: Box(
        style: Style(
          $box.height(80),
          $box.color.ref(AppColorTokens.paper),
          $box.shadow.color(Colors.black.withValues(alpha: 0.1)),
          $box.shadow.offset(0, -2),
          $box.shadow.blurRadius(10),
        ),
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