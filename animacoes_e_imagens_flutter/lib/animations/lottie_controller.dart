import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieController extends StatefulWidget {
  final String animationPath;
  final Duration duration;

  const LottieController({
    Key? key,
    required this.animationPath,
    required this.duration,
  }) : super(key: key);

  @override
  _LottieControllerState createState() => _LottieControllerState();
}

class _LottieControllerState extends State<LottieController> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.animationPath,
      controller: _controller,
      onLoaded: (composition) {
        _controller.duration = composition.duration;
      },
    );
  }
}
