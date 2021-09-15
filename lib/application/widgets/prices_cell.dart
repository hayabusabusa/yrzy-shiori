import 'package:flutter/material.dart';

class PricesCell extends StatelessWidget {
  final String description;
  final String value;

  const PricesCell({ 
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Text(this.description),
          const SizedBox(width: 8,),
          Expanded(
            child: Text(
              this.value + '円',
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}