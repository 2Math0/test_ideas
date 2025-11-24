import '../common_libs.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacingValues.cozy),
      children: [
        StyledText(
          'Profile',
          style: Style(
            $text.style.fontSize(32),
            $text.style.fontWeight.bold(),
            $text.style.color.ref(AppColorTokens.wine),
          ),
        ),
        const SizedBox(height: AppSpacingValues.comfortable),
        GlassCard(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColorValues.wine.withValues(alpha: 0.1),
                child: Icon(
                  Icons.person_rounded,
                  size: 50,
                  color: AppColorValues.wine,
                ),
              ),
              const SizedBox(height: AppSpacingValues.cozy),
              StyledText(
                'John Doe',
                style: Style(
                  $text.style.fontSize(24),
                  $text.style.fontWeight.bold(),
                  $text.style.color.ref(AppColorTokens.charcoal),
                ),
              ),
              const SizedBox(height: AppSpacingValues.tiny),
              StyledText(
                'john.doe@example.com',
                style: Style(
                  $text.style.fontSize(14),
                  $text.style.color.ref(AppColorTokens.slate),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacingValues.comfortable),
        _ProfileMenuItem(
          icon: Icons.settings_rounded,
          title: 'Settings',
          onTap: () => debugPrint('Settings tapped'),
        ),
        const SizedBox(height: AppSpacingValues.compact),
        _ProfileMenuItem(
          icon: Icons.notifications_rounded,
          title: 'Notifications',
          onTap: () => debugPrint('Notifications tapped'),
        ),
        const SizedBox(height: AppSpacingValues.compact),
        _ProfileMenuItem(
          icon: Icons.security_rounded,
          title: 'Privacy & Security',
          onTap: () => debugPrint('Privacy tapped'),
        ),
        const SizedBox(height: AppSpacingValues.compact),
        _ProfileMenuItem(
          icon: Icons.help_outline_rounded,
          title: 'Help & Support',
          onTap: () => debugPrint('Help tapped'),
        ),
        const SizedBox(height: AppSpacingValues.comfortable),
        GlassButton(
          text: 'Sign Out',
          variant: ButtonVariant.ghost,
          icon: Icons.logout_rounded,
          onPressed: () => debugPrint('Sign out pressed'),
        ),
      ],
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      elevated: false,
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColorValues.wine, size: 24),
          const SizedBox(width: AppSpacingValues.cozy),
          Expanded(
            child: StyledText(
              title,
              style: Style(
                $text.style.fontSize(16),
                $text.style.fontWeight.w500(),
                $text.style.color.ref(AppColorTokens.charcoal),
              ),
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: AppColorValues.fog),
        ],
      ),
    );
  }
}
