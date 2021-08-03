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
                  final currentIndex = 3;
                  final isCurrent = index == currentIndex;
                  final isPassed = index < currentIndex;
                  final isNext = (index - 1) == currentIndex;
                  if (index == 0) {
                    return PlanDetailTimeline.start(isCurrent: isCurrent, isPassed: isPassed,);
                  } else if (index == 4) {
                    return PlanDetailTimeline.end();
                  } else {
                    return PlanDetailTimeline(isCurrent: isCurrent, isPassed: isPassed, isNext: isNext,);
                  }
                },
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}