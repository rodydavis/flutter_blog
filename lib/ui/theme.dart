import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get light => ThemeData(
        fontFamily: 'Raleway',
        cardTheme: CardTheme(
          elevation: 6,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        brightness: Brightness.light,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(elevation: 1.0),
        bottomAppBarTheme:
            BottomAppBarTheme(color: ThemeData.light().scaffoldBackgroundColor),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
        ),
        primaryColor: Colors.blueGrey,
        accentColor: Colors.red,
        pageTransitionsTheme: _getTransition(),
      );

  static PageTransitionsTheme _getTransition() {
    return PageTransitionsTheme(
      builders:
          Map<TargetPlatform, InanimatePageTransitionsBuilder>.fromIterable(
              TargetPlatform.values.toList(),
              key: (dynamic k) => k,
              value: (dynamic _) => const InanimatePageTransitionsBuilder()),
    );
  }

  static ThemeData get dark => ThemeData(
        fontFamily: 'Raleway',
        brightness: Brightness.dark,
      ).copyWith(
        cardTheme: CardTheme(
          clipBehavior: Clip.hardEdge,
        ),
        pageTransitionsTheme: _getTransition(),
      );
}

class InanimatePageTransitionsBuilder extends PageTransitionsBuilder {
  const InanimatePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}
