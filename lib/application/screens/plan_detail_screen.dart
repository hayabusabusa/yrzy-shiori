import 'package:flutter/material.dart';

import 'package:shiori/application/screens/screens.dart';
import 'package:shiori/application/widgets/widgets.dart';

class PlanDetailScreen extends StatelessWidget {
  const PlanDetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('予定詳細'),
      ),
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            // UI: Header
            SliverList(
              delegate: SliverChildListDelegate([
                PlanDetailHeader(
                  onTapPrices: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => PricesScreen())
                    );
                  },
                  onTapBrings: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => BringsScreen())
                    );
                  },
                ),     
              ]),
            ),
            // UI: Timelines
            SliverList(
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
            ),
          ],
        ),
      ),
    );
  }
}