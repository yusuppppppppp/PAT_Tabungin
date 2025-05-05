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
            padding: const EdgeInsets.only(top: 190, left: 16.0, right: 16.0), // Fixed padding issue
            child: Padding(
              padding: const EdgeInsets.only(top: 10), // To ensure space from top
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Savings Card Section (Replaced with custom SavingsCardSection widget)
                  SavingsCardSection(
                    width: MediaQuery.of(context).size.width, // Use screen width
                    height: 150, // Custom height
                  ),

                  const SizedBox(height: 20), // Give space between sections

                  // Illustration Section
                  Center(
                    child: Column(
                      children: [
                        Image.asset('assets/image/home/Group12.png', height: 300),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Savings Options Section (Horizontal Scroll)
                  const Text(
                    'Tabungan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                    child: Row(
                      children: [
                        SavingsCard(
                          title: 'Tabungan Wajib',
                          asset: 'assets/image/home/Group71.png',
                          imageHeight: 80, // Increase the image size here
                        ),
                        SizedBox(width: 8), // Add spacing between cards
                        SavingsCard(
                          title: 'Tabungan Mana Suka',
                          asset: 'assets/image/home/Group72.png',
                          imageHeight: 80, // Increase the image size here
                        ),
                        SizedBox(width: 8), // Add spacing between cards
                        SavingsCard(
                          title: 'Sumbangan',
                          asset: 'assets/image/home/Group73.png',
                          imageHeight: 80, // Increase the image size here
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Updated Top Container with improved shadow
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                  ],
                ),
                CircleAvatar(
                  radius: 30,
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
                Get.offAll(() => HomeView());  // Use offAll to prevent navigation stack overflow
                break;
              case 1:
                Get.offAll(() => const GoalsView());
                break;
              case 2:
                Get.offAll(() => ScanView());
                break;
              case 3:
                Get.offAll(() => HistoryView());
                break;
              case 4:
                Get.offAll(() => ProfileView());
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

class SavingsCard extends StatelessWidget {
  final String title;
  final String asset;
  final double imageHeight; // Added the imageHeight parameter here

  const SavingsCard({
    super.key,
    required this.title,
    required this.asset,
    this.imageHeight = 48, // Default height if not provided
  });

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
            Image.asset(asset, height: imageHeight), // Use the dynamic imageHeight
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
  final double width; // Add parameter for width
  final double height; // Add parameter for height
  final double imageHeight; // New parameter for adjustable image height

  const SavingsCardSection({
    super.key,
    required this.width,
    required this.height,
    this.imageHeight = 200, // Default image height
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Transparent container in the background
        Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.transparent, // Transparent background
          ),
        ),

        // Main Container for "Tabungan Anda"
        Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFBBC04),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Light shadow color
                blurRadius: 8.0, // Spread and softness of the shadow
                spreadRadius: 2.0, // How much the shadow expands
                offset: const Offset(0, 4), // Shadow position
              ),
            ],
          ),
          child: Stack(
            children: [
              // Teks Tabungan Anda
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

              // Tombol Top Up
              Positioned(
                bottom: 0,
                left: 1,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Image.asset(
                    'assets/icon/home/plus-square.png', // Replace with your icon asset path
                    width: 24, // Adjust icon size if needed
                    height: 24, // Adjust icon size if needed
                  ),
                  label: const Text(
                    'Top up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              // Adjustable Image (Book Image or Similar)
              Positioned(
                left: 135,
                top: -30,
                child: Image.asset(
                  'assets/image/home/Group7.png', // Replace with your image asset
                  height: imageHeight, // Adjustable image height
                ),
              ),
            ],
          ),
        ),
      ],
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
