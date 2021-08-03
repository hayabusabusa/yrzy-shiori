import 'package:flutter/material.dart';

import 'package:shiori/application/widgets/none_pulse_circle.dart';
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

  Widget _buildCircle(BuildContext context) {
    return isCurrent
      // 現在の地点の場合は色を変えてアニメーションさせる.
      ? PulseCircle(
          size: 28,
          color: Theme.of(context).primaryColor,
          innerColor: Colors.white,
          duration: Duration(milliseconds: 1800),
        )
      : NonePulseCircle(
          size: 28,
          // 通り過ぎた地点は色を変える.
          color: isPassed
            ? Theme.of(context).primaryColor
            : Theme.of(context).dividerColor,
          innerColor: Colors.white,
        );
  }

  Widget _buildTopLine(BuildContext context) {
    return isStart 
      ? const SizedBox() 
      : Positioned(
          top: 0,
          left: 28,
          child: Container(
            width: 4,
            height: 30,
            // 今目的地もしくは通り過ぎた地点の場合は上半分のラインの色を変える.
            color: isCurrent || isPassed
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
                  _buildCircle(context),
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