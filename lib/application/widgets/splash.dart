import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final VoidCallback onAppear;

  const Splash({ 
    Key? key,
    required this.onAppear,
  }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    widget.onAppear();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}