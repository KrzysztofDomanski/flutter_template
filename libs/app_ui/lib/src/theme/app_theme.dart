import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_theme}
/// Light theme for the app
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// Defines the brightness of the theme
  Brightness get brightness => Brightness.light;

  /// Defines the background color of the theme
  Color get backgroundColor => Colors.white;

  /// Defines the primary color of the theme
  Color get primary => Colors.black;

  /// Defines light [ThemeData]
  ThemeData get theme => FlexThemeData.light(
        scheme: FlexScheme.custom,
        colors: FlexSchemeColor.from(
          brightness: brightness,
          primary: primary,
          swapOnMaterial3: true,
        ),
        useMaterial3ErrorColors: true,
      ).copyWith(
        textTheme: const AppTheme().textTheme,
        iconTheme: const IconThemeData(color: Colors.black),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          showDragHandle: true,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
      );

  TextTheme get textTheme => uiTextTheme;

  static final TextTheme uiTextTheme = TextTheme(
    displayLarge: AppTextStyles.headline1,
    displayMedium: AppTextStyles.headline2,
    displaySmall: AppTextStyles.headline3,
    headlineMedium: AppTextStyles.headline4,
    headlineSmall: AppTextStyles.headline5,
    titleLarge: AppTextStyles.headline6,
    titleMedium: AppTextStyles.subtitle1,
    titleSmall: AppTextStyles.subtitle2,
    bodyLarge: AppTextStyles.bodyText1,
    bodyMedium: AppTextStyles.bodyText2,
    labelLarge: AppTextStyles.button,
    bodySmall: AppTextStyles.caption,
    labelSmall: AppTextStyles.overline,
  ).apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
    decorationColor: Colors.black,
  );
}

/// {@template app_dark_theme}
/// Dark theme for the app
/// {@endtemplate}
class AppDarkTheme extends AppTheme {
  /// {@macro app_dark_theme}
  const AppDarkTheme();

  /// Defines the brightness of the theme
  @override
  Brightness get brightness => Brightness.dark;

  /// Defines the background color of the theme
  @override
  Color get backgroundColor => Colors.black;

  /// Defines the primary color of the theme
  @override
  Color get primary => Colors.white;

  @override
  TextTheme get textTheme {
    return AppTheme.uiTextTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
      decorationColor: Colors.white,
    );
  }

  /// Defines dark [ThemeData]
  @override
  ThemeData get theme => FlexThemeData.dark(
        scheme: FlexScheme.custom,
        darkIsTrueBlack: true,
        useMaterial3ErrorColors: true,
        colors: FlexSchemeColor.from(
          primary: primary,
          brightness: brightness,
          swapOnMaterial3: true,
          appBarColor: Colors.transparent,
        ),
      ).copyWith(
        textTheme: const AppDarkTheme().textTheme,
        iconTheme: const IconThemeData(color: Colors.white),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black,
          surfaceTintColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          surfaceTintColor: AppColors.background,
          backgroundColor: AppColors.background,
          modalBackgroundColor: AppColors.background,
        ),
      );
}
