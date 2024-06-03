import 'package:flutter/material.dart';

class BurningTicketScreen extends StatelessWidget {
  const BurningTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Горящие билеты'),
      ),
    );
  }
}
