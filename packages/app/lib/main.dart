import 'common_libs.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: TestIdeasApp()));
}

class TestIdeasApp extends ConsumerWidget {
  const TestIdeasApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixTheme = ref.watch(themeProvider);

    return MixTheme(
      data: mixTheme,
      child: MaterialApp(
        title: 'Test Ideas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColorValues.canvas,
        ),
        home: const MainScaffold(),
      ),
    );
  }
}

class MainScaffold extends ConsumerWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final navItems = ref.watch(navItemsProvider);

    return SafeArea(
      child: Scaffold(
        body: _getPage(selectedIndex),
        bottomNavigationBar: GlassNavBar(
          selectedIndex: selectedIndex,
          onTap: (index) =>
              ref.read(selectedIndexProvider.notifier).state = index,
          items: navItems,
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    return switch (index) {
      0 => const HomeScreen(),
      1 => const ExploreScreen(),
      2 => const FavoritesScreen(),
      3 => const ProfileScreen(),
      _ => const HomeScreen(),
    };
  }
}
