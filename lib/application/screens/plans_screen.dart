import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shiori/application/application_router.dart';
import 'package:shiori/application/view_models/view_models.dart';
import 'package:shiori/application/widgets/widgets.dart';
import 'package:shiori/shared/shared.dart';

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
    final isLoading = context.select((PlansViewModel viewModel) => viewModel.isLoading);
    final plans = context.select((PlansViewModel viewModel) => viewModel.plans);
    return Scaffold(
      appBar: AppBar(
        title: const Text('予定一覧'),
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: isLoading 
          ? Center(
              child: PlatformIndicator(),
            )
          : ListView.builder(
            itemCount: plans.length,
            itemBuilder: (_, index) {
              final plan = plans[index];
              return PlansCell(
                title: 'みんなでグランピング！東海出発組 🏎', 
                destination: plan.destination, 
                departureDate: plan.departureDate.formattedString('MM月dd日'),
                homeDate: plan.homeDate.formattedString('MM月dd日'),
                onTap: () {
                  Navigator.of(context).pushNamed(ApplicationRouter.planDetail);
                },
              );
            },
          ),
      ),
    );
  }
}