import 'package:flutter/material.dart';

class PricesTotalCell extends StatelessWidget {
  final String value;

  const PricesTotalCell({ 
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // UI: Divider
        Container(
          height: 1,
          color: Theme.of(context).dividerColor,
        ),
        // UI: Contents
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Text(
                '合計',
                style: TextStyle(
                  fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: Text(
                  this.value + '円',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}