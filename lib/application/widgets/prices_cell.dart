import 'package:flutter/material.dart';

class PricesCell extends StatelessWidget {
  const PricesCell({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Text('ガソリン代'),
          const SizedBox(width: 8,),
          Expanded(
            child: Text(
              '16,800円',
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}