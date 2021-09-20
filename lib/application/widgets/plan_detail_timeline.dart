import 'package:flutter/material.dart';

import 'package:shiori/application/widgets/none_pulse_circle.dart';
import 'package:shiori/application/widgets/pulse_circle.dart';

class PlanDetailTimeline extends StatelessWidget {
  final String name;
  final String arrivalDate;
  final String departureDate;
  final String? description;
  final bool isStart;
  final bool isCurrent;
  final bool isPassed;
  final bool isNext;
  final bool isEnd;
  final VoidCallback? onTap;

  PlanDetailTimeline({ 
    Key? key,
    required this.name,
    required this.arrivalDate,
    required this.departureDate,
    this.description,
    this.isStart = false,
    this.isCurrent = false,
    this.isPassed = false,
    this.isNext = false,
    this.isEnd = false,
    this.onTap,
  }) : super(key: key);

  factory PlanDetailTimeline.start({
    Key? key,
    required String name,
    required String arrivalDate,
    required String departureDate,
    String? description,
    bool isCurrent = false,
    bool isPassed = false,
    VoidCallback? onTap,
  }) => PlanDetailTimeline(
    key: key,
    name: name,
    arrivalDate: arrivalDate,
    departureDate: departureDate,
    description: description,
    isStart: true,
    isCurrent: isCurrent,
    isPassed: isPassed,
    isNext: false,
    isEnd: false,
    onTap: onTap,
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

  Widget _buildDateLabels(BuildContext context) {
    // 到着時刻と出発時刻が同じ時間なら到着時刻のみ表示する.
    return this.departureDate == this.arrivalDate 
      ? Text(
          this.arrivalDate,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              this.arrivalDate,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              this.departureDate,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
  }

  Widget _buildCard(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // UI: Destination
              Text(
                this.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12,),
              // UI: Description
              Text(
                this.description ?? '',
                style: Theme.of(context).textTheme.caption,
              ),
              // UI: Images
              // Wrap(
              //   children: [
              //     Container(
              //       width: 40,
              //       height: 40,
              //       color: Theme.of(context).dividerColor,
              //     ),
              //   ],
              // ),
            ],
          ),
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
                  // UI: Date Labels
                  _buildDateLabels(context),
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