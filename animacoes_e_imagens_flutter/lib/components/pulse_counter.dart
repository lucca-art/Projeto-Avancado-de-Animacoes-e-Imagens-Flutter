import 'package:flutter/material.dart';

class PulseCounter extends StatelessWidget {
  final int count;

  const PulseCounter({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: AlwaysStoppedAnimation(1.2),
      child: Text(
        '$count',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
