import 'package:flutter/material.dart';

import 'package:shiori/application/application.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlansScreen(),
      theme: ApplicationTheme.light,
      darkTheme: ApplicationTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}