import 'package:flutter/material.dart';

class PlanDetailHeader extends StatelessWidget {
  final VoidCallback? onTapPrices;
  final VoidCallback? onTapBrings;

  const PlanDetailHeader({ 
    Key? key,
    this.onTapPrices,
    this.onTapBrings,
  }) : super(key: key);

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
                'みんなでグランピング！東海組',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 4,),
              // UI: Description
              Text(
                '去年のリベンジで聖地静岡の伊豆にグランピングしに行きます。今年こそはマシュマロを炭で焼いて食べたいです。',
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
                      '伊豆シャボテンビレッジ',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  const SizedBox(width: 8,),
                  TextButton(
                    onPressed: () {}, 
                    child: Text('予約詳細'),
                  )
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
                      '8月1日 - 8月2日',
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
                onPressed: onTapPrices, 
                icon: Icon(Icons.paid_rounded), 
                label: Text('32,000円'),
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
                onPressed: onTapBrings, 
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