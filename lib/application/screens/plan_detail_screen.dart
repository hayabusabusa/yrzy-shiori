import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shiori/application/application_router.dart';
import 'package:shiori/application/view_models/view_models.dart';
import 'package:shiori/application/widgets/widgets.dart';
import 'package:shiori/shared/shared.dart';

class PlanDetailScreen extends StatelessWidget {

  static Widget wrapped({
    required PlanDetailViewModel viewModel,
  }) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: PlanDetailScreen._(),
    );
  }

  PlanDetailScreen._({ Key? key }) : super(key: key);

  Widget _buildTimelineSliverList(BuildContext context) {
    final isLoading = context.select((PlanDetailViewModel viewModel) => viewModel.isLoading);
    //final timelines = context.select((PlanDetailViewModel viewModel) => viewModel.timelines);
    return isLoading 
      ? SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        )
      : SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              // 現在地を仮に2とする.
              final currentIndex = 2;
              final isCurrent = index == currentIndex;
              final isPassed = index < currentIndex;
              final isNext = (index - 1) == currentIndex;
              if (index == 0) {
                // 開始地点のセル.
                return PlanDetailTimeline.start(isCurrent: isCurrent, isPassed: isPassed,);
              } else if (index == 4) {
                // 帰宅地点のセル.
                return PlanDetailTimelineEnd(isCurrent: isCurrent,);
              } else {
                // 通過途中のセル.
                return PlanDetailTimeline(isCurrent: isCurrent, isPassed: isPassed, isNext: isNext,);
              }
            },
            childCount: 5,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final plan = context.select((PlanDetailViewModel viewModel) => viewModel.plan);
    return Scaffold(
      appBar: AppBar(
        title: Text('予定詳細'),
      ),
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            // UI: Header
            SliverToBoxAdapter(
              child: PlanDetailHeader(
                title: plan.title,
                destination: plan.destination,
                dateString: '${plan.departureDate.formattedString('MM月dd日')} - ${plan.homeDate.formattedString('MM月dd日')}',
                totalPrice: plan.totalPrice,
                description: plan.description,
                onTapPrices: () {
                  Navigator.of(context).pushNamed(ApplicationRouter.prices);
                },
                onTapBrings: () {
                  Navigator.of(context).pushNamed(ApplicationRouter.brings);
                },
              ),
            ),
            // UI: Timelines
            _buildTimelineSliverList(context),
          ],
        ),
      ),
    );
  }
}