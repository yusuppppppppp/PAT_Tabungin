import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/goals_controller.dart';

class GoalsView extends GetView<GoalsController> {
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
