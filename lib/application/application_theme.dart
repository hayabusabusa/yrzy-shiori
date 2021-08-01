import 'package:flutter/material.dart';

class ApplicationTheme {
  /// アプリのライトモードのテーマ
  static final light = ThemeData.light().copyWith(
    // メインカラー
    primaryColor: Color.fromRGBO(73, 187, 137, 1.0),
    // divider のカラー
    dividerColor: Color.fromRGBO(237, 237, 237, 1.0),
    // Scaffold の背景色
    scaffoldBackgroundColor: Colors.white,
    // AppBar のテーマ
    appBarTheme: AppBarTheme(
      // AppBar の背景色
      color: Colors.white,
      shadowColor: Colors.black38,
      // AppBar のタイトルのフォント設定
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.grey.shade800,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      // AppBar のアイコンの色
      iconTheme: IconThemeData(
        color: Colors.grey.shade600,
      ),
      // AppBar のアクションに設定したアイコンの色
      actionsIconTheme: IconThemeData(
        color: Colors.grey.shade600,
      ),
    ),
  );

  /// アプリのダークモードのテーマ
  static final dark = ThemeData.dark().copyWith(
    // メインカラー
    primaryColor: Color.fromRGBO(86, 197, 150, 1.0),
    // divider のカラー
    dividerColor: Color.fromRGBO(84, 84, 88, 1.0),
    // AppBar のテーマ
    appBarTheme: AppBarTheme(
      // AppBar の背景色
      color: Color.fromRGBO(48, 48, 48, 1.0),
      // AppBar のタイトルのフォント設定
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}