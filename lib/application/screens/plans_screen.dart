import 'package:flutter/material.dart';

import 'package:shiori/application/widgets/widgets.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('予定一覧'),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (_, index) {
          return PlansCell(
            title: 'みんなでグランピング！東海出発組 🏎', 
            destination: '伊豆シャボテンビレッジ', 
            departureDate: '8月1日', 
            homeDate: '8月2日'
          );
        },
      ),
    );
  }
}