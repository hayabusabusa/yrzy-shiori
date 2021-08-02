import 'package:flutter/material.dart';

import 'package:shiori/application/widgets/pulse_circle.dart';

class PlanDetailTimeline extends StatelessWidget {
  final bool isStart;
  final bool isCurrent;
  final bool isPassed;
  final bool isNext;
  final bool isEnd;

  PlanDetailTimeline({ 
    Key? key,
    this.isStart = false,
    this.isCurrent = false,
    this.isPassed = false,
    this.isNext = false,
    this.isEnd = false,
  }) : super(key: key);

  factory PlanDetailTimeline.start({
    Key? key,
    bool isCurrent = false,
    bool isPassed = false,
  }) => PlanDetailTimeline(
    key: key,
    isStart: true,
    isCurrent: isCurrent,
    isPassed: isPassed,
    isNext: false,
    isEnd: false,
  );

  factory PlanDetailTimeline.end({
    Key? key,
    bool isCurrent = false,
    bool isPassed = false,
  }) => PlanDetailTimeline(
    key: key,
    isStart: false,
    isCurrent: isCurrent,
    isPassed: isPassed,
    isNext: true,
    isEnd: true,
  );

  Widget _buildTopLine(BuildContext context) {
    return isStart 
      ? const SizedBox() 
      : Positioned(
          top: 0,
          left: 28,
          child: Container(
            width: 4,
            height: 30,
            // 次の目的地もしくは通り過ぎた地点の場合は上半分のラインの色を変える.
            color: isNext || isPassed
              ? Theme.of(context).primaryColor 
              : Theme.of(context).dividerColor,
          ),
        );
  }

  Widget _buildBottomLine(BuildContext context) {
    return Positioned(
      top: 30,
      left: 28,
      bottom: 0,
      child: Container(
        width: 4,
        // 通り過ぎた地点の場合はラインの色を変える.
        color: isPassed
          ? Theme.of(context).primaryColor
          : Theme.of(context).dividerColor,
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // UI: Destination
            Text('場所の名前 XXXX YYYYY ZZZZZ'),
            const SizedBox(height: 12,),
            // UI: Images
            Wrap(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  color: Theme.of(context).dividerColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // UI: Top line
        _buildTopLine(context),
        // UI: Bottom line
        _buildBottomLine(context),
        // UI: Contents
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // UI: Circles
              Row(
                children: [
                  // UI: Circle
                  PulseCircle(
                    size: 28,
                    // 現在の地点の場合は色を変えてアニメーションさせる.
                    color: isCurrent 
                      ? Theme.of(context).primaryColor 
                      : Theme.of(context).dividerColor,
                    innerColor: Colors.white,
                    duration: Duration(milliseconds: 1800),
                  ),
                  const SizedBox(width: 16,),
                  // UI: Departure time
                  Text('08:30')
                ],
              ),
              const SizedBox(height: 8,),
              // UI: Cards
              Row(
                children: [
                  // UI: Spacer
                  const SizedBox(width: 40,),
                  // UI: Card
                  Expanded(
                    child: _buildCard(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}