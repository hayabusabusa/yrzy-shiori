import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  Widget build(BuildContext context) {
    final plan = context.select((PlanDetailViewModel viewModel) => viewModel.plan);
    final isLoading = context.select((PlanDetailViewModel viewModel) => viewModel.isLoading);
    final timelines = context.select((PlanDetailViewModel viewModel) => viewModel.timelines);
    final currentIndex = timelines.indexWhere((e) => !e.isPassed);
    return Scaffold(
      appBar: AppBar(
        title: Text('予定詳細'),
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: isLoading 
          ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          )
          : Scrollbar(
            child: CustomScrollView(
              slivers: [
                // UI: Header
                SliverToBoxAdapter(
                  child: PlanDetailHeader(
                    title: plan.title,
                    destination: plan.destination,
                    dateString: '${plan.departureDate.formattedString('MM月dd日')} - ${plan.arrivalDate.formattedString('MM月dd日')}',
                    totalPrice: plan.totalPrice,
                    description: plan.description,
                    onTapPrices: () {
                      final args = PricesArgs(plan: plan);
                      Navigator.of(context).pushNamed(ApplicationRouter.prices, arguments: args);
                    },
                    onTapBrings: () {
                      final args = BringsArgs(plan: plan);
                      Navigator.of(context).pushNamed(ApplicationRouter.brings, arguments: args);
                    },
                    onTapLink: plan.url == null 
                      ? null 
                      : () async {
                          final linkURL = plan.url ?? '';
                          if (await canLaunch(linkURL)) {
                            await launch(
                              linkURL,
                              forceSafariVC: true,
                              forceWebView: true,
                            );
                        }
                    },
                  ),
                ),
                // UI: Timelines
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final timeline = timelines[index];
                      final isCurrent = index == currentIndex;
                      final isNext = (index - 1) == currentIndex;
                      if (index == 0) {
                        // 開始地点のセル.
                        return PlanDetailTimeline.start(
                          name: timeline.point.name,
                          arrivalDate: timeline.point.arrivalDate.formattedString('HH:mm'),
                          departureDate: timeline.point.departureDate.formattedString('HH:mm'),
                          description: timeline.point.description,
                          isCurrent: isCurrent, 
                          isPassed: timeline.isPassed,
                          onTap: () {
                            //Navigator.of(context).pushNamed(ApplicationRouter.pointDetail);
                          },
                        );
                      } else if (index == timelines.length - 1) {
                        // 帰宅地点のセル.
                        // 過去の予定などで現在地点が見つからなかった場合は、帰宅のセルを現在地としてハイライト表示にする.
                        return PlanDetailTimelineEnd(
                          name: plan.destination,
                          arrivalDate: plan.arrivalDate.formattedString('HH:mm'),
                          isCurrent: currentIndex == - 1 ? true : isCurrent,
                        );
                      } else {
                        // 通過途中のセル.
                        return PlanDetailTimeline(
                          name: timeline.point.name,
                          arrivalDate: timeline.point.arrivalDate.formattedString('HH:mm'),
                          departureDate: timeline.point.departureDate.formattedString('HH:mm'),
                          description: timeline.point.description,
                          isCurrent: isCurrent, 
                          isPassed: timeline.isPassed, 
                          isNext: isNext,
                          onTap: () {
                            //Navigator.of(context).pushNamed(ApplicationRouter.pointDetail);
                          },
                        );
                      }
                    },
                    childCount: timelines.length,
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}