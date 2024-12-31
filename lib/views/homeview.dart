import 'package:flutter/material.dart';
import 'package:noname_app/views/cal.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CalculatorView(),
      ),
    );
  }
}
