// pages/dashboard_page.dart
import 'package:flutter/material.dart';
import '../widgets/animated_card.dart';
import '../components/pulse_counter.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int itemCount = 0;

  void _incrementCounter() {
    setState(() {
      itemCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PulseCounter(count: itemCount),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: List.generate(4, (index) {
            return AnimatedCard(
              index: index,
              onAdd: _incrementCounter,
            );
          }),
        ),
      ),
    );
  }
}
