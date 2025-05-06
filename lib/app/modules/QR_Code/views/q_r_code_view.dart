import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/q_r_code_controller.dart';

class QRCodeView extends GetView<QRCodeController> {
  const QRCodeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QRCodeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QRCodeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
