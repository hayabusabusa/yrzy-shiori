import 'package:flutter/material.dart';

class PlanDetailTimeline extends StatelessWidget {
  const PlanDetailTimeline({ Key? key }) : super(key: key);

  Widget _buildLine(BuildContext context) {
    return Positioned(
      top: 0,
      left: 28,
      bottom: 0,
      child: Container(
        width: 4,
        color: Theme.of(context).dividerColor,
      ),
    );
  }

  Widget _buildCircle(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      color: Theme.of(context).primaryColor,
    );
  }

  Widget _buildWrappedImages(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: 40,
          height: 40,
          color: Theme.of(context).dividerColor,
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('場所の名前 XXXX YYYYY ZZZZZ'),
            const SizedBox(height: 12,),
            _buildWrappedImages(context),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // UI: Line
        _buildLine(context),
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