import 'package:get/get.dart';

import '../controllers/reset_pw_controller.dart';

class ResetPwBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPwController>(
      () => ResetPwController(),
    );
  }
}
