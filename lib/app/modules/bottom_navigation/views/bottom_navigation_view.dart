import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungin/app/modules/home/views/home_view.dart';
import 'package:tabungin/app/modules/goals/views/goals_view.dart';
import 'package:tabungin/app/modules/bottom_navigation/controllers/bottom_navigation_controller.dart';


class BottomNavigationView extends StatelessWidget {
  BottomNavigationView({super.key});

  final BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return HomeView();
          case 1:
            return GoalsView();
          default:
            return HomeView();
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.updateIndex(index);
          },
          selectedItemColor: const Color(0xFFFBBC04),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flag),
              label: 'Goals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        );
      }),
    );
  }
}
