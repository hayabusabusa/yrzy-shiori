import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // UI: Logo
            Image.asset(
              'assets/logo.png',
              width: 56,
              height: 56,
            ),
            const SizedBox(height: 12,),
            // UI: Text
            Text(
              'SHIORI',
              style: Theme.of(context).textTheme.overline?.merge(
                TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}