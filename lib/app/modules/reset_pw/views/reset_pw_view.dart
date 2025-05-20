import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_pw_controller.dart';

class ResetPwView extends GetView<ResetPwController> {
  const ResetPwView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResetPwView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ResetPwView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
