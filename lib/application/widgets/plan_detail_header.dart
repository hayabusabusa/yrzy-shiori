import 'package:flutter/material.dart';

import 'package:shiori/shared/shared.dart';

class PlanDetailHeader extends StatelessWidget {
  final String title;
  final String destination;
  final String date;
  final int totalPrice;
  final String? description;
  final VoidCallback? onTapPrices;
  final VoidCallback? onTapBrings;
  final VoidCallback? onTapLink;

  const PlanDetailHeader({
    Key? key,
    required this.title,
    required this.destination,
    required this.date,
    required this.totalPrice,
    this.description,
    this.onTapPrices,
    this.onTapBrings,
    this.onTapLink,
  }) : super(key: key);

  Widget _buildLinkButton() {
    return this.onTapLink == null 
      ? const SizedBox()
      : TextButton(
          onPressed: this.onTapLink, 
          child: Text('予約詳細'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // UI: Titles
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // UI: Title
              Text(
                this.title,
                style: Theme.of(context).textTheme.subtitle1?.merge(
                  TextStyle(fontWeight: FontWeight.w800)
                ),
              ),
              const SizedBox(height: 4,),
              // UI: Description
              Text(
                this.description ?? '',
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(height: 8,),
              // UI: Destinations
              Row(
                children: [
                  Icon(
                    Icons.flag_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Text(
                      this.destination,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  const SizedBox(width: 8,),
                  _buildLinkButton(),
                ],
              ),
              // UI: Date
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Text(
                      this.date,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // UI: Separator
        Container(
          height: 1,
          color: Theme.of(context).dividerColor,
        ),
        // UI: Row buttons
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextButton.icon(
                onPressed: this.onTapPrices, 
                icon: Icon(Icons.paid_rounded), 
                label: Text('${this.totalPrice.formattedString('#,###')}円'),
              ),
            ),
            Container(
              width: 1,
              height: 16,
              color: Theme.of(context).dividerColor,
            ),
            Expanded(
              flex: 1,
              child: TextButton.icon(
                onPressed: this.onTapBrings, 
                icon: Icon(Icons.badge_rounded), 
                label: Text('持ち物を確認'),
              ),
            ),
          ],
        ),
        // UI: Separator
        Container(
          height: 1,
          color: Theme.of(context).dividerColor,
        ),
      ],
    );
  }
}