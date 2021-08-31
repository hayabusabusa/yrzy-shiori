import 'package:flutter/material.dart';

class PointDetailScreen extends StatelessWidget {
  PointDetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('地点詳細'),
      ),
    );
  }
}