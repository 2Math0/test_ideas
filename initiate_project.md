# Normal Bash

## Navigate to the project

```bash
cd test_ideas
```

## Create melos monorepo structure

```bash
mkdir packages/app/lib/providers
mkdir packages/app/lib/screens
mkdir packages/design_system/lib/src/tokens
mkdir packages/design_system/lib/src/theme
mkdir packages/design_system/lib/src/components
mkdir packages/app/docs
```

## Create all necessary files

```bash
touch melos.yaml
# Create design system files
touch packages/design_system/pubspec.yaml
touch packages/design_system/lib/design_system.dart
touch packages/design_system/lib/common_libs.dart
touch packages/design_system/lib/src/tokens/color_tokens.dart
touch packages/design_system/lib/src/tokens/radius_tokens.dart
touch packages/design_system/lib/src/tokens/spacing_tokens.dart
touch packages/design_system/lib/src/theme/app_theme.dart
touch packages/design_system/lib/src/components/glass_card.dart
touch packages/design_system/lib/src/components/glass_button.dart
# Create app files
touch packages/app/pubspec.yaml
touch packages/app/lib/main.dart
touch packages/app/lib/common_libs.dart
touch packages/app/lib/providers/theme_provider.dart
touch packages/app/lib/screens/home_screen.dart
touch packages/app/lib/screens/explore_screen.dart
touch packages/app/lib/screens/favorites_screen.dart
touch packages/app/lib/screens/profile_screen.dart
touch packages/app/docs/USAGE.md
```

# Powershell

## Navigate to the project (make sure the folder exists first)

```powershell
if (!(Test-Path "test_ideas")) { mkdir "test_ideas" }
cd test_ideas
```

### Create directories

### (In PowerShell, mkdir creates parent folders automatically, so these work fine)

```powershell
mkdir packages/app/lib/providers
mkdir packages/app/lib/screens
mkdir packages/design_system/lib/src/tokens
mkdir packages/design_system/lib/src/theme
mkdir packages/design_system/lib/src/components
mkdir packages/app/docs
```

## Create all necessary files (replacing 'touch' with 'ni')

```powershell
ni melos.yaml

# Create design system files
ni packages/design_system/pubspec.yaml
ni packages/design_system/lib/design_system.dart
ni packages/design_system/lib/common_libs.dart
ni packages/design_system/lib/src/tokens/color_tokens.dart
ni packages/design_system/lib/src/tokens/radius_tokens.dart
ni packages/design_system/lib/src/tokens/spacing_tokens.dart
ni packages/design_system/lib/src/theme/app_theme.dart
ni packages/design_system/lib/src/components/glass_card.dart
ni packages/design_system/lib/src/components/glass_button.dart

# Create App files
ni packages/app/pubspec.yaml
ni packages/app/lib/main.dart
ni packages/app/lib/common_libs.dart
ni packages/app/lib/providers/theme_provider.dart
ni packages/app/lib/screens/home_screen.dart
ni packages/app/lib/screens/explore_screen.dart
ni packages/app/lib/screens/favorites_screen.dart
ni packages/app/lib/screens/profile_screen.dart
ni packages/app/docs/USAGE.md
```