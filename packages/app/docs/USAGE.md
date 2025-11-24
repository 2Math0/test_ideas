# Design System Usage Guide

## Overview

This design system uses **Mix** for theming with custom tokens and **Riverpod** for state management. It features a wine/burgundy color palette with gold accents.

## Installation

In your `pubspec.yaml`:

```yaml
dependencies:
  design_system:
    path: ../design_system
  flutter_riverpod: ^2.5.1
  mix: ^1.0.0
```

## Color Tokens
### Available Colors

All colors use semantic names, not generic terms like "primary" or "secondary":
```dart
// Wine colors (main brand color - burgundy #800020)
AppColorTokens.wine // Main wine color
AppColorTokens.wineDark // Darker shade
AppColorTokens.wineLight // Lighter shade

// Gold colors (accent)
AppColorTokens.gold // Gold accent
AppColorTokens.goldLight // Light gold

// Neutrals
AppColorTokens.cloud // Very light gray
AppColorTokens.mist // Light gray
AppColorTokens.fog // Medium light gray
AppColorTokens.slate // Medium dark gray
AppColorTokens.charcoal // Dark gray

// Surfaces
AppColorTokens.paper // White surface
AppColorTokens.canvas // Off-white background
AppColorTokens.ink // Text color
AppColorTokens.snow // Pure white

// Status
AppColorTokens.emerald // Success
AppColorTokens.ruby // Error
AppColorTokens.amber // Warning
```
### Using Color Tokens
```dart
StyledText(
  'Hello World',
  style: Style(
    text.style.color.ref(AppColorTokens.wine),
  ),
)

Box(
  style: Style(
    box.color.ref(AppColorTokens.paper),
  ),
  child: Text('Content'),
)
```