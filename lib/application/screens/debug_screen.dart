import 'package:flutter/material.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🛠デバッグメニュー'),
      ),
    );
  }
}