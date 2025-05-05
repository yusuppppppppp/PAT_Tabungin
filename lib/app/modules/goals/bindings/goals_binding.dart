import 'package:get/get.dart';
import 'package:tabungin/app/modules/goals/controllers/goals_controller.dart';

class GoalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GoalsController>(GoalsController());
  }
}
