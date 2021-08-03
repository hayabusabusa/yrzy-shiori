import 'package:flutter/material.dart';

class NonePulseCircle extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? innerColor;

  const NonePulseCircle({ 
    Key? key,
    this.color,
    this.innerColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).primaryColor;
    final innerColor = this.innerColor ?? Theme.of(context).scaffoldBackgroundColor;
    final innerSize = this.size / 2;
    final innerPosition = this.size / 4;
    return Stack(
      children: [
        // UI: Outer circle
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 2,
                spreadRadius: 2,
              ),
            ],
          ),
        ),
        // UI: Inner circle
        Positioned(
          top: innerPosition,
          left: innerPosition,
          child: Container(
            width: innerSize,
            height: innerSize,
            decoration: BoxDecoration(
              color: innerColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}