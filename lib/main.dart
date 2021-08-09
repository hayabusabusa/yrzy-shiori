import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:shiori/application/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    Firebase.initializeApp(),
  ]);

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ApplicationTheme.light,
      darkTheme: ApplicationTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: ApplicationRouter.home,
      onGenerateRoute: (settings) => ApplicationRouter.generateRoute(settings),
    );
  }
}