import 'package:flutter/material.dart';

class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoalsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GoalsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
  