import 'package:flutter/material.dart';

/// Dashboard-specific color themes
class DashboardThemes {
  // Private constructor to prevent instantiation
  DashboardThemes._();

  /// Citizen Dashboard - confident cobalt, deep navy and clear aqua
  static const CitizenTheme = DashboardTheme(
    primaryColor: Color(0xFF176BFF),
    primaryVariant: Color(0xFF102B4E),
    secondaryColor: Color(0xFF53D8E8),
    secondaryVariant: Color(0xFF1599B6),
    surfaceColor: Color(0xFFFFFFFF),
    backgroundColor: Color(0xFFF3F6FB),
    errorColor: Color(0xFFB42318),
    onPrimaryColor: Colors.white,
    onSecondaryColor: Color(0xFF103047),
    onSurfaceColor: Color(0xFF17283F),
    onBackgroundColor: Color(0xFF17283F),
    cardColor: Colors.white,
    dividerColor: Color(0xFFE2E9F2),
    shadowColor: Color(0x14102B4E),
    accentColor: Color(0xFF25BFD0),
    successColor: Color(0xFF147DAB),
    warningColor: Color(0xFFB76E12),
    dangerColor: Color(0xFFB42318),
    infoColor: Color(0xFF176BFF),
  );

  /// Researcher Dashboard - focused sapphire with clear aqua
  static const ResearcherTheme = DashboardTheme(
    primaryColor: Color(0xFF245FE5),
    primaryVariant: Color(0xFF102B4E),
    secondaryColor: Color(0xFF53D8E8),
    secondaryVariant: Color(0xFF1599B6),
    surfaceColor: Color(0xFFFFFFFF),
    backgroundColor: Color(0xFFF3F6FB),
    errorColor: Color(0xFFB42318),
    onPrimaryColor: Colors.white,
    onSecondaryColor: Color(0xFF103047),
    onSurfaceColor: Color(0xFF17283F),
    onBackgroundColor: Color(0xFF17283F),
    cardColor: Colors.white,
    dividerColor: Color(0xFFE2E9F2),
    shadowColor: Color(0x14102B4E),
    accentColor: Color(0xFF25BFD0),
    successColor: Color(0xFF147DAB),
    warningColor: Color(0xFFB76E12),
    dangerColor: Color(0xFFB42318),
    infoColor: Color(0xFF176BFF),
  );

  /// Policy Maker Dashboard - royal blue with the shared aqua accent
  static const PolicyMakerTheme = DashboardTheme(
    primaryColor: Color(0xFF4057D6),
    primaryVariant: Color(0xFF102B4E),
    secondaryColor: Color(0xFF53D8E8),
    secondaryVariant: Color(0xFF1599B6),
    surfaceColor: Color(0xFFFFFFFF),
    backgroundColor: Color(0xFFF3F6FB),
    errorColor: Color(0xFFB42318),
    onPrimaryColor: Colors.white,
    onSecondaryColor: Color(0xFF103047),
    onSurfaceColor: Color(0xFF17283F),
    onBackgroundColor: Color(0xFF17283F),
    cardColor: Colors.white,
    dividerColor: Color(0xFFE2E9F2),
    shadowColor: Color(0x14102B4E),
    accentColor: Color(0xFF25BFD0),
    successColor: Color(0xFF147DAB),
    warningColor: Color(0xFFB76E12),
    dangerColor: Color(0xFFB42318),
    infoColor: Color(0xFF176BFF),
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
    final surface = isDark ? const Color(0xFF142840) : cardColor;
    final background = isDark ? const Color(0xFF0B1728) : backgroundColor;
    final foreground = isDark ? const Color(0xFFEAF2FF) : onSurfaceColor;
    final outline = isDark ? const Color(0xFF29415B) : dividerColor;

    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      splashFactory: InkSparkle.splashFactory,
      visualDensity: VisualDensity.standard,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: ZoomPageTransitionsBuilder(),
        },
      ),
      primarySwatch: _createMaterialColor(primaryColor),
      primaryColor: primaryColor,
      primaryColorDark: primaryVariant,
      primaryColorLight: secondaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: secondaryVariant,
        surface: surface,
        error: errorColor,
        onPrimary: onPrimaryColor,
        onSecondary: onSecondaryColor,
        onTertiary: Colors.white,
        onSurface: foreground,
        brightness: brightness,
      ),
      scaffoldBackgroundColor: background,
      iconTheme: IconThemeData(color: primaryColor),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionColor: primaryColor.withValues(alpha: 0.2),
        selectionHandleColor: primaryColor,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF243A52) : const Color(0xFF102B4E),
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(color: Colors.white, fontSize: 12),
      ),
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
        elevation: isDark ? 0 : 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: BorderSide(color: outline),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        foregroundColor: foreground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: foreground),
        actionsIconTheme: IconThemeData(color: primaryColor),
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
        fillColor: isDark ? const Color(0xFF102239) : surface,
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: errorColor, width: 2),
        ),
      ),
      dividerTheme: DividerThemeData(color: outline, thickness: 1, space: 1),
      listTileTheme: ListTileThemeData(
        iconColor: primaryColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: outline),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: surface,
          surfaceTintColor: Colors.transparent,
          showDragHandle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
        ),
        tabBarTheme: TabBarThemeData(
          labelColor: primaryColor,
          unselectedLabelColor: foreground.withValues(alpha: 0.6),
          indicatorColor: primaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3,
          dividerColor: outline,
          labelStyle: const TextStyle(fontWeight: FontWeight.w700),
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
            ? const Color(0xFF142840)
            : const Color(0xFF102B4E),
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
        circularTrackColor: primaryColor.withValues(alpha: 0.12),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: isDark
            ? const Color(0xFF1B3652)
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
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: surface,
        indicatorColor: primaryColor.withValues(alpha: isDark ? 0.24 : 0.1),
        selectedIconTheme: IconThemeData(color: primaryColor),
        unselectedIconTheme: IconThemeData(
          color: foreground.withValues(alpha: 0.65),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return Colors.white;
          return isDark ? const Color(0xFF9AAEC4) : Colors.white;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return primaryColor;
          return isDark ? const Color(0xFF344B64) : const Color(0xFFD8E1ED);
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected) ? primaryColor : null;
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? primaryColor
              : foreground.withValues(alpha: 0.55);
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
