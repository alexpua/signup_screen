import 'package:clario_test_task/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  appColors.onSurface,
                  appColors.surface,
                ],
              ),
            ),
          ),
          Positioned(
            top: 57,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/bg.png',
              ),
            ),
          ),
          SafeArea(child: child ?? Container()),
        ],
      ),
    );
  }
}
