import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabungin/app/modules/goals/views/goals_view.dart';
import 'package:tabungin/app/modules/QR_Code/views/q_r_code_view.dart';
import 'package:tabungin/app/modules/History/views/history_view.dart';
import 'package:tabungin/app/modules/Profile/views/profile_view.dart';
import 'package:tabungin/app/modules/bottom_navigation/controllers/bottom_navigation_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final BottomNavigationController controller =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return HomePageContent(); // Custom home content
          case 1:
            return GoalsView();
          case 2:
            return QRCodeView();
          case 3:
            return HistoryView();
          case 4:
            return ProfileView();
          default:
            return HomePageContent();
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateIndex(2); // Pindah ke tab QR-Code
        },
        backgroundColor: const Color(0xFF252D66),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replaced with custom QR code asset
            Image(
              image: AssetImage('assets/icon/navbar/scan.png'),
              color: Color(0xFFFDB623),
              width: 30,
              height: 30,
            ),
            SizedBox(height: 2),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavItem(
                  assetPath: 'assets/icon/navbar/home.png',
                  label: 'Home',
                  index: 0,
                  controller: controller,
                ),
                _buildBottomNavItem(
                  assetPath: 'assets/icon/navbar/goals.png',
                  label: 'Goals',
                  index: 1,
                  controller: controller,
                ),
                const SizedBox(width: 40), // Placeholder untuk FAB
                _buildBottomNavItem(
                  assetPath: 'assets/icon/navbar/history.png',
                  label: 'History',
                  index: 3,
                  controller: controller,
                ),
                _buildBottomNavItem(
                  assetPath: 'assets/icon/navbar/profil.png',
                  label: 'Profile',
                  index: 4,
                  controller: controller,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildBottomNavItem({
    required String assetPath,
    required String label,
    required int index,
    required BottomNavigationController controller,
  }) {
    bool isSelected = controller.selectedIndex.value == index;
    return GestureDetector(
      onTap: () => controller.updateIndex(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFBBC04).withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(assetPath),
              width: 24,
              height: 24,
              color: isSelected ? const Color(0xFFFBBC04) : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFFFBBC04) : Colors.grey,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Rest of the code remains the same...
class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get access to the BottomNavigationController
    final BottomNavigationController navController =
        Get.find<BottomNavigationController>();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 190, left: 16.0, right: 16.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SavingsCardSection(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Text(
                          "Goals",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.timeline,
                              color: Color(0xFFFFC107)),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),

                  Column(
                    children: [
                      _buildGoalCard(
                        context,
                        title: "Sepedah impian",
                        percentage: 40,
                        asset: 'assets/image/goals/Group19.png',
                      ),
                      const SizedBox(height: 16),
                      _buildGoalCard(
                        context,
                        title: "Laptop impian",
                        percentage: 70,
                        asset: 'assets/image/goals/Vector.png',
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 125, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Text(
                          "Tabungan",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SavingsCard(
                          title: 'Wajib',
                          asset: 'assets/image/home/Group71.png',
                          imageHeight: 80,
                        ),
                        SizedBox(width: 8),
                        SavingsCard(
                          title: 'Manasuka',
                          asset: 'assets/image/home/Group72.png',
                          imageHeight: 80,
                        ),
                        SizedBox(width: 8),
                        SavingsCard(
                          title: 'Sumbangan',
                          asset: 'assets/image/home/Group73.png',
                          imageHeight: 80,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50), // Adding spacing after the cards
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 6),
                ),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(
                        color: Color(0xFFFFA500),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Alvaretttt',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Nabung Yuk!',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.518),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                // Made the CircleAvatar clickable and navigate to Profile
                GestureDetector(
                  onTap: () {
                    // Navigate to Profile tab (index 4)
                    navController.updateIndex(4);
                  },
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/image/home/Ellipse5.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalCard(
    BuildContext context, {
    required String title,
    required int percentage,
    required String asset,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFFBBC04),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset(
                  asset,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: percentage / 100,
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFFBBC04),
                            ),
                            minHeight: 5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '$percentage%',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFBBC04),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SavingsCard extends StatelessWidget {
  final String title;
  final String asset;
  final double imageHeight;

  const SavingsCard({
    super.key,
    required this.title,
    required this.asset,
    this.imageHeight = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFBBC04),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(asset, height: imageHeight),
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

class SavingsCardSection extends StatelessWidget {
  final double width;
  final double height;
  final double imageHeight;

  const SavingsCardSection({
    super.key,
    required this.width,
    required this.height,
    this.imageHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
        ),
        Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFBBC04),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8.0,
                spreadRadius: 2.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
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
                    'Rp. 1.000.000',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 1,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Image.asset(
                    'assets/icon/home/plus-square.png',
                    width: 24,
                    height: 24,
                  ),
                  label: const Text(
                    'Top up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                left: 80, // Posisi gambar anjing di kanan
                bottom: -90, // Mengatur gambar supaya tidak terlalu mepet
                child: Image.asset(
                  'assets/image/home/Group7.png',
                  height: 280, // Menyesuaikan tinggi gambar
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
