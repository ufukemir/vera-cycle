import 'package:flutter/material.dart';

/// Shown only while [CycleController.load] is decrypting the on-disk store.
/// Brief by construction — history is at most a few years of small daily
/// records — so this stays a bare spinner rather than earning its own
/// design.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
