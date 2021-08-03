import 'package:flutter/material.dart';

import 'package:shiori/application/widgets/none_pulse_circle.dart';

class PlanDetailTimelineEnd extends StatelessWidget {
  final bool isCurrent;

  const PlanDetailTimelineEnd({ 
    Key? key,
    this.isCurrent = false,
  }) : super(key: key);

  Widget _buildTopLine(BuildContext context) {
    return Positioned(
      top: 0,
      left: 28,
      child: Container(
        width: 4,
        height: 30,
        // 今目的地の場合は上半分のラインの色を変える.
        color: isCurrent
          ? Theme.of(context).primaryColor 
          : Theme.of(context).dividerColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // UI: Top line
        _buildTopLine(context),
        // UI: Contents
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // UI: Circles
              Row(
                children: [
                  // UI: Circle
                  NonePulseCircle(
                    size: 28,
                    color: isCurrent 
                      ? Theme.of(context).primaryColor 
                      : Theme.of(context).dividerColor,
                    innerColor: Colors.white,
                  ),
                  const SizedBox(width: 16,),
                  // UI: Departure time
                  Text('08:30'),
                  const SizedBox(width: 8,),
                  Text('帰宅'),
                ],
              ),
              // UI: Spacer
              const SizedBox(height: 28,),
            ],
          ),
        ),
      ],
    );
  }
}