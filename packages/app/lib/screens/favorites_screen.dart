import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common_libs.dart';
import '../widgets/background_widgets.dart';

final backgroundIndexProvider = StateProvider<int>((ref) => 0);

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _scaleController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();

    _scaleController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundIndex = ref.watch(backgroundIndexProvider);

    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          // Background
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                ref.read(backgroundIndexProvider.notifier).state =
                    (backgroundIndex + 1) % 3;
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: _buildBackground(backgroundIndex),
              ),
            ),
          ),

          // Glass effects layer
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacingValues.cozy),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: AppSpacingValues.comfortable),
                    _buildSimpleGlassCard(),
                    const SizedBox(height: AppSpacingValues.cozy),
                    _buildBlendedShapes(),
                    const SizedBox(height: AppSpacingValues.cozy),
                    _buildRotatingGlass(),
                    const SizedBox(height: AppSpacingValues.cozy),
                    _buildInteractiveGlassButton(),
                    const SizedBox(height: AppSpacingValues.cozy),
                    _buildFakeGlassComparison(),
                    const SizedBox(height: AppSpacingValues.cozy),
                    _buildStretchyGlass(),
                    const SizedBox(height: AppSpacingValues.comfortable),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(int index) {
    return switch (index) {
      0 => const ColorfulGradient(),
      1 => const GridBackground(),
      2 => const VerticalStripes(),
      _ => const ColorfulGradient(),
    };
  }

  Widget _buildHeader() {
    return LiquidGlassLayer(
      settings: const LiquidGlassSettings(
        thickness: 20,
        blur: 15,
        glassColor: Color(0x44FFFFFF),
        lightIntensity: 1.5,
        saturation: 1.2,
      ),
      child: LiquidGlass(
        shape: LiquidRoundedSuperellipse(borderRadius: 20),
        child: Container(
          padding: const EdgeInsets.all(AppSpacingValues.cozy),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Liquid Glass Showcase',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColorValues.charcoal,
                ),
              ),
              const SizedBox(height: AppSpacingValues.compact),
              Text(
                'Tap background to change • All examples from docs',
                style: TextStyle(fontSize: 14, color: AppColorValues.slate),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSimpleGlassCard() {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          LiquidGlassLayer(
            settings: const LiquidGlassSettings(
              thickness: 15,
              blur: 10,
              glassColor: Color(0x33FFFFFF),
              lightIntensity: 1.3,
            ),
            child: Center(
              child: LiquidGlass(
                shape: LiquidRoundedSuperellipse(borderRadius: 30),
                child: Container(
                  width: 150,
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 50,
                        color: AppColorValues.wine,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Simple Glass',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColorValues.charcoal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlendedShapes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacingValues.compact),
          child: Text(
            'Blended Glass Group',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColorValues.charcoal,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: LiquidGlassLayer(
            settings: const LiquidGlassSettings(
              thickness: 18,
              blur: 12,
              glassColor: Color(0x44FFFFFF),
              lightIntensity: 1.4,
            ),
            child: LiquidGlassBlendGroup(
              blend: 40.0,
              child: Stack(
                children: [
                  Positioned(
                    left: 40,
                    top: 50,
                    child: LiquidGlass.grouped(
                      shape: LiquidRoundedSuperellipse(borderRadius: 30),
                      child: Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.favorite_rounded,
                          color: AppColorValues.wine,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 50,
                    child: LiquidGlass.grouped(
                      shape: LiquidRoundedSuperellipse(borderRadius: 30),
                      child: Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.star_rounded,
                          color: AppColorValues.gold,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 160,
                    top: 50,
                    child: LiquidGlass.grouped(
                      shape: LiquidRoundedSuperellipse(borderRadius: 30),
                      child: Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.auto_awesome_rounded,
                          color: AppColorValues.wine,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRotatingGlass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacingValues.compact),
          child: Text(
            'Animated Rotation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColorValues.charcoal,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: LiquidGlassLayer(
            settings: const LiquidGlassSettings(
              thickness: 20,
              blur: 8,
              glassColor: Color(0x33FFFFFF),
              lightIntensity: 1.8,
            ),
            child: Center(
              child: AnimatedBuilder(
                animation: _rotationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationController.value * 2 * pi,
                    child: LiquidGlass(
                      shape: LiquidRoundedSuperellipse(borderRadius: 25),
                      child: Container(
                        width: 120,
                        height: 120,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.refresh_rounded,
                          size: 50,
                          color: AppColorValues.wine,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveGlassButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacingValues.compact),
          child: Text(
            'Interactive Glass with Glow',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColorValues.charcoal,
            ),
          ),
        ),
        LiquidGlassLayer(
          settings: const LiquidGlassSettings(
            thickness: 15,
            blur: 10,
            glassColor: Color(0x44FFFFFF),
            lightIntensity: 1.5,
          ),
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Glass tapped!'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: GlassGlow(
              glowColor: Colors.white24,
              glowRadius: 1.2,
              child: LiquidGlass(
                shape: LiquidRoundedSuperellipse(borderRadius: 20),
                child: Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.touch_app_rounded,
                        color: AppColorValues.wine,
                        size: 30,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Tap Me!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColorValues.charcoal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFakeGlassComparison() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacingValues.compact),
          child: Text(
            'Real vs Fake Glass',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColorValues.charcoal,
            ),
          ),
        ),
        Row(
          children: [
            // Real Glass
            Expanded(
              child: SizedBox(
                height: 140,
                child: LiquidGlassLayer(
                  settings: const LiquidGlassSettings(
                    thickness: 15,
                    blur: 10,
                    glassColor: Color(0x44FFFFFF),
                  ),
                  child: LiquidGlass(
                    shape: LiquidRoundedSuperellipse(borderRadius: 20),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.auto_awesome_rounded,
                            color: AppColorValues.wine,
                            size: 40,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Real Glass',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColorValues.charcoal,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Expensive',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColorValues.slate,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSpacingValues.cozy),
            // Fake Glass
            Expanded(
              child: SizedBox(
                height: 140,
                child: FakeGlass(
                  shape: LiquidRoundedSuperellipse(borderRadius: 20),
                  settings: const LiquidGlassSettings(
                    blur: 10,
                    glassColor: Color(0x44FFFFFF),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.speed_rounded,
                          color: AppColorValues.gold,
                          size: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Fake Glass',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColorValues.charcoal,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Fast',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColorValues.slate,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStretchyGlass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacingValues.compact),
          child: Text(
            'Stretchy Interactive Glass',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColorValues.charcoal,
            ),
          ),
        ),
        LiquidStretch(
          stretch: 0.3,
          interactionScale: 1.05,
          child: LiquidGlassLayer(
            settings: const LiquidGlassSettings(
              thickness: 18,
              blur: 12,
              glassColor: Color(0x44FFFFFF),
              lightIntensity: 1.6,
            ),
            child: LiquidGlass(
              shape: LiquidRoundedSuperellipse(borderRadius: 25),
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.pan_tool_rounded,
                      color: AppColorValues.wine,
                      size: 35,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Drag Me!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColorValues.charcoal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
