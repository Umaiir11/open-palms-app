import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:open_palms/app/config/app_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(AppAssets.splashLogo, height: 150)
            // 🎬 Animate the logo
            .animate()
            .fadeIn(duration: 1200.ms, curve: Curves.easeInOut)
            .scale(begin: const Offset(0.7, 0.7), end: const Offset(1.0, 1.0), duration: 1000.ms, curve: Curves.easeOutBack)
            .then(delay: 500.ms) // after first animation
            .shake(duration: 700.ms, hz: 2, curve: Curves.easeInOut),
      ),
    );
  }
}
