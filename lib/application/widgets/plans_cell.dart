import 'package:flutter/material.dart';

class PlansCell extends StatelessWidget {
  final String title;
  final String destination;
  final String departureDate;
  final String homeDate;

  const PlansCell({ 
    Key? key,
    required this.title,
    required this.destination,
    required this.departureDate,
    required this.homeDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            // UI: Contents
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // UI: Title
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12,),
                  // UI: Destination
                  Row(
                    children: [
                      Icon(
                        Icons.flag_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 4,),
                      Text(
                        destination,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  // UI: Date
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 4,),
                      Text(
                        '$departureDate - $homeDate',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              )
            ),
            const SizedBox(width: 8,),
            // UI: Icon
            Icon(
              Icons.chevron_right_rounded,
              color: Theme.of(context).dividerColor,
            )
          ],
        ),
      ),
    );
  }
}