import 'package:flutter/material.dart';

class VerticalStripes extends StatelessWidget {
  const VerticalStripes({super.key, this.stripeThickness = 100.0});

  final double stripeThickness;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _VerticalStripesPainter(stripeThickness: stripeThickness),
      size: Size.infinite,
    );
  }
}

class _VerticalStripesPainter extends CustomPainter {
  const _VerticalStripesPainter({required this.stripeThickness});

  final double stripeThickness;

  @override
  void paint(Canvas canvas, Size size) {
    final blackPaint = Paint()..color = Colors.black;
    final whitePaint = Paint()..color = Colors.white;

    double currentX = 0;
    bool isBlack = true;

    while (currentX < size.width) {
      final rect = Rect.fromLTWH(currentX, 0, stripeThickness, size.height);
      canvas.drawRect(rect, isBlack ? blackPaint : whitePaint);
      currentX += stripeThickness;
      isBlack = !isBlack;
    }
  }

  @override
  bool shouldRepaint(covariant _VerticalStripesPainter oldDelegate) {
    return oldDelegate.stripeThickness != stripeThickness;
  }
}

class GridBackground extends StatelessWidget {
  const GridBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFCEC5B4), Color(0xFFF2F0EA)],
        ),
      ),
      child: GridPaper(
        color: const Color(0xFF0F0B0A).withValues(alpha: 0.2),
        interval: 100,
      ),
    );
  }
}

class ColorfulGradient extends StatelessWidget {
  const ColorfulGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF800020), // Wine
            Color(0xFFD4AF37), // Gold
            Color(0xFF800020), // Wine
          ],
        ),
      ),
    );
  }
}