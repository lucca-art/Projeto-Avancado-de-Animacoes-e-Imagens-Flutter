import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../components/add_button.dart';
import '../widgets/modal_details.dart';

class AnimatedCard extends StatefulWidget {
  final int index;
  final VoidCallback onAdd;

  const AnimatedCard({required this.index, required this.onAdd, Key? key}) : super(key: key);

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> with TickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController meterController;
  double meterValue = 0.0;

  @override
  void initState() {
    super.initState();
    meterController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Garante que o valor seja animado sempre que expandir
    meterController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    meterController.dispose();
    super.dispose();
  }

  void toggleCard() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        meterValue = Random().nextDouble() * 0.7 + 0.3; // entre 0.3 e 1.0
        meterController.forward(from: 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleCard();
        if (isExpanded) {
          Future.delayed(Duration(milliseconds: 400), () {
            showModalBottomSheet(
              context: context,
              builder: (_) => ModalDetails(
                subItems: [
                  'Sub-item 1', 
                  'Sub-item 2', 
                  'Sub-item 3',
                ], // Passando a lista de sub-itens
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
            );
          });
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: isExpanded ? EdgeInsets.all(16) : EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isExpanded ? Colors.red.shade50 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [if (isExpanded) BoxShadow(color: Colors.black26, blurRadius: 8)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset('assets/images/img${widget.index + 1}.png')),
            SizedBox(height: 8),
            Text("Título ${widget.index + 1}", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Subtítulo", style: TextStyle(color: Colors.black54)),
            if (isExpanded) ...[
              SizedBox(height: 12),
              CustomPaint(
                size: Size(60, 60),
                painter: MeterPainter(progress: meterController.value * meterValue),
              ),
              SizedBox(height: 12),
              AddButton(onPressed: widget.onAdd),
            ]
          ],
        ),
      ),
    );
  }
}

class MeterPainter extends CustomPainter {
  final double progress;

  MeterPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final basePaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    canvas.drawCircle(center, radius, basePaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(MeterPainter oldDelegate) => progress != oldDelegate.progress;
}
