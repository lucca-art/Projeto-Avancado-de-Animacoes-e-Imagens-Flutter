import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class AddButton extends StatefulWidget {
  final VoidCallback onPressed;

  const AddButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    _scaleAnimation = _controller.drive(Tween(begin: 1.0, end: 1.0));
  }

  void _runSpringAnimation() {
    final spring = SpringDescription(mass: 1, stiffness: 500, damping: 15);
    final simulation = SpringSimulation(spring, 0, 1, -5);
    _controller.animateWith(simulation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _runSpringAnimation();
        widget.onPressed();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          final scale = 1.0 + 0.1 * (_controller.value);
          return Transform.scale(
            scale: scale.clamp(0.9, 1.1),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Adicionar",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
