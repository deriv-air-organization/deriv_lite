import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get light {
    return ThemeData(
      listTileTheme: ThemeData.dark().listTileTheme.copyWith(
            iconColor: Colors.white,
          ),
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.black,
      textTheme: ThemeData.dark().textTheme,
      iconTheme: ThemeData.dark().iconTheme,
      primaryIconTheme: ThemeData.dark().iconTheme.copyWith(color: Colors.red),
      tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.white,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.white, width: 2),
          ),
        ),
      ),
    );
  }
}
