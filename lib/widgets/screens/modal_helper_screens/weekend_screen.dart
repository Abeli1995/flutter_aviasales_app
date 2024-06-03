import 'package:flutter/material.dart';

class WeekendScreen extends StatelessWidget {
  const WeekendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Выходные'),
      ),
    );
  }
}
