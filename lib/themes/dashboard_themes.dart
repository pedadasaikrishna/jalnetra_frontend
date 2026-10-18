import 'package:flutter/material.dart';

/// Dashboard-specific color themes
class DashboardThemes {
  // Private constructor to prevent instantiation
  DashboardThemes._();

  /// Citizen Dashboard - deep ocean blue with clear-water cyan
  static const CitizenTheme = DashboardTheme(
    primaryColor: Color(0xFF075985),
    primaryVariant: Color(0xFF0B3B60),
    secondaryColor: Color(0xFF67E8F9),
    secondaryVariant: Color(0xFF0891B2),
    surfaceColor: Color(0xFFF5FAFE),
    backgroundColor: Color(0xFFECF6FB),
    errorColor: Color(0xFFB42318),
    onPrimaryColor: Colors.white,
    onSecondaryColor: Color(0xFF083344),
    onSurfaceColor: Color(0xFF142B3A),
    onBackgroundColor: Color(0xFF142B3A),
    cardColor: Colors.white,
    dividerColor: Color(0xFFDCEAF2),
    shadowColor: Color(0x12075985),
    accentColor: Color(0xFF06B6D4),
    successColor: Color(0xFF0284C7),
    warningColor: Color(0xFFB76E12),
    dangerColor: Color(0xFFB42318),
    infoColor: Color(0xFF0284C7),
  );

  /// Researcher Dashboard - crisp blue with glacial cyan
  static const ResearcherTheme = DashboardTheme(
    primaryColor: Color(0xFF0369A1),
    primaryVariant: Color(0xFF164E78),
    secondaryColor: Color(0xFF7DD3FC),
    secondaryVariant: Color(0xFF38BDF8),
    surfaceColor: Color(0xFFF4F9FD),
    backgroundColor: Color(0xFFEAF4FA),
    errorColor: Color(0xFFB42318),
    onPrimaryColor: Colors.white,
    onSecondaryColor: Color(0xFF0C3148),
    onSurfaceColor: Color(0xFF172A3B),
    onBackgroundColor: Color(0xFF172A3B),
    cardColor: Colors.white,
    dividerColor: Color(0xFFDCE8F1),
    shadowColor: Color(0x120369A1),
    accentColor: Color(0xFF0EA5E9),
    successColor: Color(0xFF0284C7),
    warningColor: Color(0xFFB76E12),
    dangerColor: Color(0xFFB42318),
    infoColor: Color(0xFF0284C7),
  );

  /// Policy Maker Dashboard - deep-water blue with bright aqua
  static const PolicyMakerTheme = DashboardTheme(
    primaryColor: Color(0xFF1D4ED8),
    primaryVariant: Color(0xFF1E3A8A),
    secondaryColor: Color(0xFF7DD3FC),
    secondaryVariant: Color(0xFF38BDF8),
    surfaceColor: Color(0xFFF5F8FE),
    backgroundColor: Color(0xFFEEF4FC),
    errorColor: Color(0xFFB42318),
    onPrimaryColor: Colors.white,
    onSecondaryColor: Color(0xFF102C4A),
    onSurfaceColor: Color(0xFF1A2940),
    onBackgroundColor: Color(0xFF1A2940),
    cardColor: Colors.white,
    dividerColor: Color(0xFFDDE7F2),
    shadowColor: Color(0x121D4ED8),
    accentColor: Color(0xFF0EA5E9),
    successColor: Color(0xFF0284C7),
    warningColor: Color(0xFFB76E12),
    dangerColor: Color(0xFFB42318),
    infoColor: Color(0xFF0284C7),
  );
}

/// Dashboard theme data class
class DashboardTheme {
  final Color primaryColor;
  final Color primaryVariant;
  final Color secondaryColor;
  final Color secondaryVariant;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color errorColor;
  final Color onPrimaryColor;
  final Color onSecondaryColor;
  final Color onSurfaceColor;
  final Color onBackgroundColor;
  final Color cardColor;
  final Color dividerColor;
  final Color shadowColor;
  final Color accentColor;
  final Color successColor;
  final Color warningColor;
  final Color dangerColor;
  final Color infoColor;

  const DashboardTheme({
    required this.primaryColor,
    required this.primaryVariant,
    required this.secondaryColor,
    required this.secondaryVariant,
    required this.surfaceColor,
    required this.backgroundColor,
    required this.errorColor,
    required this.onPrimaryColor,
    required this.onSecondaryColor,
    required this.onSurfaceColor,
    required this.onBackgroundColor,
    required this.cardColor,
    required this.dividerColor,
    required this.shadowColor,
    required this.accentColor,
    required this.successColor,
    required this.warningColor,
    required this.dangerColor,
    required this.infoColor,
  });

  /// Convert to Flutter ThemeData with brightness support
  ThemeData toThemeData({Brightness brightness = Brightness.light}) {
    final isDark = brightness == Brightness.dark;
    final surface = isDark ? const Color(0xFF10283A) : cardColor;
    final background = isDark ? const Color(0xFF091A28) : surfaceColor;
    final foreground = isDark ? const Color(0xFFE5F4FC) : onSurfaceColor;
    final outline = isDark ? const Color(0xFF29465A) : dividerColor;

    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      primarySwatch: _createMaterialColor(primaryColor),
      primaryColor: primaryColor,
      primaryColorDark: primaryVariant,
      primaryColorLight: secondaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surface,
        error: errorColor,
        onPrimary: onPrimaryColor,
        onSecondary: onSecondaryColor,
        onSurface: foreground,
        brightness: brightness,
      ),
      scaffoldBackgroundColor: background,
      textTheme:
          (isDark
                  ? Typography.material2021(
                      platform: TargetPlatform.android,
                    ).white
                  : Typography.material2021(
                      platform: TargetPlatform.android,
                    ).black)
              .apply(bodyColor: foreground, displayColor: foreground)
              .copyWith(
                headlineLarge: TextStyle(
                  color: foreground,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                  height: 1.12,
                ),
                headlineMedium: TextStyle(
                  color: foreground,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
                titleLarge: TextStyle(
                  color: foreground,
                  fontWeight: FontWeight.w700,
                ),
                titleMedium: TextStyle(
                  color: foreground,
                  fontWeight: FontWeight.w600,
                ),
                bodyMedium: TextStyle(color: foreground, height: 1.45),
              ),
      cardTheme: CardThemeData(
        color: surface,
        shadowColor: isDark ? Colors.black26 : shadowColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: outline),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: foreground,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: foreground,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          elevation: 0,
          minimumSize: const Size(48, 52),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          minimumSize: const Size(48, 48),
          side: BorderSide(color: primaryColor.withValues(alpha: 0.45)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          minimumSize: const Size(48, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? const Color(0xFF153247) : surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: outline),
        ),
      ),
      dividerTheme: DividerThemeData(color: outline, thickness: 1, space: 1),
      listTileTheme: ListTileThemeData(
        iconColor: primaryColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: outline),
        ),
        titleTextStyle: TextStyle(
          color: foreground,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isDark
            ? const Color(0xFF12334A)
            : const Color(0xFF103B5C),
        contentTextStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryColor,
        linearTrackColor: primaryColor.withValues(alpha: 0.12),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: isDark
            ? const Color(0xFF17384E)
            : primaryColor.withValues(alpha: 0.07),
        selectedColor: primaryColor.withValues(alpha: 0.14),
        side: BorderSide(color: outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        labelStyle: TextStyle(color: foreground, fontWeight: FontWeight.w600),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: primaryColor.withValues(alpha: isDark ? 0.24 : 0.12),
        elevation: 0,
        height: 72,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            fontSize: 12,
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w700
                : FontWeight.w500,
            color: states.contains(WidgetState.selected)
                ? primaryColor
                : foreground.withValues(alpha: 0.7),
          );
        }),
      ),
    );
  }

  /// Create MaterialColor from Color
  MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

/// Theme extensions for custom colors
extension DashboardThemeExtension on ThemeData {
  DashboardTheme get dashboardTheme {
    if (primaryColor == DashboardThemes.CitizenTheme.primaryColor) {
      return DashboardThemes.CitizenTheme;
    } else if (primaryColor == DashboardThemes.ResearcherTheme.primaryColor) {
      return DashboardThemes.ResearcherTheme;
    } else if (primaryColor == DashboardThemes.PolicyMakerTheme.primaryColor) {
      return DashboardThemes.PolicyMakerTheme;
    }
    return DashboardThemes.CitizenTheme; // Default fallback
  }
}
