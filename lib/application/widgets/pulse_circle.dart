import 'package:flutter/material.dart';

class PulseCircle extends StatefulWidget {
  final double size;
  final Color? color;
  final Color? innerColor;
  final Duration? duration;

  PulseCircle({
    Key? key,
    this.color,
    this.innerColor,
    this.duration,
    required this.size,
  }) : super(key: key);

  @override
  _PulseCircleState createState() => _PulseCircleState();
}

class _PulseCircleState extends State<PulseCircle> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    final duration = widget.duration ?? Duration(seconds: 1);
    _animationController = AnimationController(vsync: this, duration: duration);
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 0.8, end: 4.0)
      .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))
      ..addListener(() { 
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).primaryColor;
    final innerColor = widget.innerColor ?? Theme.of(context).scaffoldBackgroundColor;
    final innerSize = widget.size / 2;
    final innerPosition = widget.size / 4;
    return Stack(
      children: [
        // UI: Outer circle
        Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: _animation.value,
                spreadRadius: _animation.value,
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