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
    );
  }
}