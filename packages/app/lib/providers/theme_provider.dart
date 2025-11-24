import '../common_libs.dart';

final themeProvider = Provider<MixThemeData>((ref) {
  return createAppTheme();
});

final navItemsProvider = Provider<List<NavBarItem>>((ref) {
  return [
    (icon: Icons.home_rounded, label: 'Home'),
    (icon: Icons.explore_rounded, label: 'Explore'),
    (icon: Icons.favorite_rounded, label: 'Favorites'),
    (icon: Icons.person_rounded, label: 'Profile'),
  ];
});

final selectedIndexProvider = StateProvider<int>((ref) => 0);