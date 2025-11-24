import '../../common_libs.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

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
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          // Background with color
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColorValues.paper,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
            ),
          ),

          // Liquid glass layer for effects
          LiquidGlassLayer(
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