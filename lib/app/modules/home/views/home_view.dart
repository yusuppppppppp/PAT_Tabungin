import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungin/app/modules/goals/views/goals_view.dart';
import 'package:tabungin/app/modules/home/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 140, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Savings Card Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBBC04),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tabungan Anda:',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Rp. 100.000.000',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: const Text('+ Top up'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Illustration Section
                  Center(
                    child: Column(
                      children: [
                        Image.asset('assets/image/home/Group12.png', height: 300),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Savings Options Section
                  const Text(
                    'Tabungan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SavingsCard(title: 'Tabungan Wajib', asset: 'assets/image/home/Group71.png'),
                      SavingsCard(title: 'Tabungan Mana Suka', asset: 'assets/image/home/Group72.png'),
                      SavingsCard(title: 'Sumbangan', asset: 'assets/image/home/Group73.png'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 4), // Shadow position
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hello Alvaretttt',
                  style: TextStyle(
                    color: Color(0xFFFFA500), // Orange color
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image/home/Ellipse5.png'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.updateIndex(index);
            switch (index) {
              case 0:
                Get.to(() => HomeView());
                break;
              case 1:
                Get.to(() => const GoalsView());
                break;
              case 2:
                Get.to(() => HistoryView());
                break;
              case 3:
                Get.to(() => ProfileView());
                break;
              case 4:
                Get.to(() => ScanView());
                break;
            }
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
              label: 'Scan',  // Move Scan button to center
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',  // Move History button right after Scan
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',  // Profile button at the far right
            ),
          ],
          type: BottomNavigationBarType.fixed, // Keeps all items aligned correctly
        );
      }),
    );
  }
}

class SavingsCard extends StatelessWidget {
  final String title;
  final String asset;

  const SavingsCard({super.key, required this.title, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFBBC04),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(asset, height: 48),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Center(
        child: const Text('History Page'),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: const Text('Profile Page'),
      ),
    );
  }
}

class ScanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan'),
      ),
      body: Center(
        child: const Text('Scan Page'),
      ),
    );
  }
}