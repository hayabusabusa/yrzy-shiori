import 'package:flutter/material.dart';

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
                PlanDetailHeader(),     
              ]),
            ),
            // UI: Timelines
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return PlanDetailTimeline();
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