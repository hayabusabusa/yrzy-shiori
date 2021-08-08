import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shiori/application/screens/screens.dart';
import 'package:shiori/application/view_models/view_models.dart';
import 'package:shiori/application/widgets/widgets.dart';

class PlansScreen extends StatelessWidget {

  static Widget wrapped({
    required PlansViewModel viewModel
  }) {
    final _viewModel = viewModel;
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: PlansScreen(),
    );
  }

  PlansScreen({ Key? key }) : super(key: key);

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
            homeDate: '8月2日',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => PlanDetailScreen())
              );
            },
          );
        },
      ),
    );
  }
}