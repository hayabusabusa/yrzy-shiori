import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shiori/application/application_router.dart';
import 'package:shiori/application/view_models/view_models.dart';
import 'package:shiori/application/widgets/widgets.dart';

class PlansScreen extends StatelessWidget {

  static Widget wrapped({
    required PlansViewModel viewModel
  }) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
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
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : RefreshIndicator(
            color: Theme.of(context).primaryColor,
            onRefresh: () async {
              context.read<PlansViewModel>().onRefresh();
            },
            child: Scrollbar(
              child: ListView.builder(
                itemCount: plans.length,
                itemBuilder: (_, index) {
                  final plan = plans[index];
                  return PlansCell(
                    title: plan.title, 
                    destination: plan.destination, 
                    date: plan.formattedDurationString(),
                    onTap: () {
                      final args = PlanDetailArgs(plan: plan);
                      Navigator.of(context).pushNamed(ApplicationRouter.planDetail, arguments: args);
                    },
                  );
                },
              ),
            ),
          ),
      ),
    );
  }
}