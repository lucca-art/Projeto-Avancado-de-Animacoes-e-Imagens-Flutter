import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dashboard_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showLottie = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..forward().whenComplete(() {
        setState(() => _showLottie = true);
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => DashboardPage()));
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedCrossFade(
        duration: Duration(seconds: 2),
        crossFadeState:
            _showLottie ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstChild: CachedNetworkImage(
          imageUrl: 'https://picsum.photos/800/600',
          placeholder: (context, url) => Image.asset('assets/placeholder.png'),
          fadeInDuration: Duration(seconds: 1),
          fit: BoxFit.cover,
        ),
        secondChild: Center(
          child: Hero(
            tag: 'appLogo',
            child: Lottie.asset('assets/animations/welcome.json'),
          ),
        ),
      ),
    );
  }
}