import 'package:flutter/material.dart';

class BringsHeader extends StatelessWidget {
  const BringsHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).errorColor.withOpacity(0.16),
      child: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: Theme.of(context).errorColor,
          ),
          const SizedBox(width: 8,),
          Text(
            'チェックボックスの状態は保存されません',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).errorColor,
            ),
          ),
        ],
      ),
    );
  }
}