import 'package:flutter/material.dart';

import 'package:shiori/application/widgets/none_pulse_circle.dart';

class PlanDetailTimelineEnd extends StatelessWidget {
  final String name;
  final String arrivalDate;
  final bool isCurrent;

  const PlanDetailTimelineEnd({ 
    Key? key,
    required this.name,
    required this.arrivalDate,
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
                  // UI: Arrival time
                  Text(
                    this.arrivalDate,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8,),
                  // UI: Name
                  Text(this.name),
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