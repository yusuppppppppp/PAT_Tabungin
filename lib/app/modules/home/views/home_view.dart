import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

// Class SavingsBottomSheet untuk handle bottom sheet
class SavingsBottomSheet {
  static void showBottomSheet({
    required BuildContext context,
    required String title,
    required Color buttonColor,
    String? subtitle,
  }) {
    final TextEditingController amountController = TextEditingController();
    DateTime selectedDate = DateTime.now();
    
    // Warna tema oranye yang konsisten
    final Color primaryOrange = const Color(0xFFFFA726);
    final Color darkOrange = const Color(0xFFE65100);
    final Color lightOrange = const Color(0xFFFFCC80);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, lightOrange.withOpacity(0.2)],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: darkOrange.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle bar di bagian atas
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Header dengan icon dekoratif
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: primaryOrange.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.savings_outlined,
                          color: darkOrange,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: darkOrange,
                            ),
                          ),
                          if (subtitle != null)
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  
                  // Nominal Field
                  Text(
                    'Nominal',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Rp.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: darkOrange,
                                ),
                              ),
                            ],
                          ),
                        ),
                        hintText: 'Masukkan nominal',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: lightOrange,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: primaryOrange,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                   
                  // Tanggal Field
                  Text(
                    'Tanggal',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: primaryOrange,
                                onPrimary: Colors.white,
                                onSurface: Colors.black,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: lightOrange, width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 20,
                            color: darkOrange,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            DateFormat('dd MMMM yyyy').format(selectedDate),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_drop_down,
                            color: primaryOrange,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        if (amountController.text.isNotEmpty) {
                          Navigator.pop(context); // Menutup BottomSheet
                          BottomNavigationController controller = Get.find();
                          controller.updateIndex(2); // Beralih ke halaman QRCodeView
                        } else {
                          // Tampilkan animasi shake pada field nominal
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Harap masukkan nominal'),
                              backgroundColor: darkOrange,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryOrange,
                        foregroundColor: Colors.white,
                        elevation: 3,
                        shadowColor: primaryOrange.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Selanjutnya',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}

// Rest of the code remains the same...
class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

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

                  // Modified SavingsCard section with onTap functionality
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SavingsCard(
                          title: 'Wajib',
                          asset: 'assets/image/home/Group71.png',
                          imageHeight: 80,
                          onTap: () {
                            SavingsBottomSheet.showBottomSheet(
                              context: context,
                              title: 'Wajib',
                              buttonColor: const Color(0xFFFF9800), // Green
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        SavingsCard(
                          title: 'Manasuka',
                          asset: 'assets/image/home/Group72.png',
                          imageHeight: 80,
                          onTap: () {
                            SavingsBottomSheet.showBottomSheet(
                              context: context,
                              title: 'Manasuka',
                              buttonColor: const Color.fromARGB(
                                  255, 0, 102, 255), // Orange
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        SavingsCard(
                          title: 'Sumbangan',
                          asset: 'assets/image/home/Group73.png',
                          imageHeight: 80,
                          onTap: () {
                            SavingsBottomSheet.showBottomSheet(
                              context: context,
                              title: 'Sumbangan',
                              buttonColor: const Color(0xFF252D66), // Blue
                            );
                          },
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
  final VoidCallback? onTap; // Added onTap callback

  const SavingsCard({
    super.key,
    required this.title,
    required this.asset,
    this.imageHeight = 48,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
                  onPressed: () {
                    _showTopUpBottomSheet(context);
                  },
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

  void _showTopUpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return TopUpFormBottomSheet();
      },
    );
  }
}

class TopUpFormBottomSheet extends StatefulWidget {
  const TopUpFormBottomSheet({Key? key}) : super(key: key);

  @override
  _TopUpFormBottomSheetState createState() => _TopUpFormBottomSheetState();
}

class _TopUpFormBottomSheetState extends State<TopUpFormBottomSheet> {
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Start with "0" so the prefix is visible immediately
    _amountController.text = "0";
  }

  // Format currency to Rupiah
  String _formatCurrency(String value) {
    if (value.isEmpty) return '0';

    // Remove non-digit characters
    String digits = value.replaceAll(RegExp(r'[^\d]'), '');

    // Format with thousand separators
    final formatter = NumberFormat("#,###", "id_ID");
    if (digits.isNotEmpty) {
      return formatter.format(int.parse(digits));
    }
    return '0';
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showBarcodeBottomSheet() {
    Navigator.pop(context); // Close current bottom sheet

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return BarcodeBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Warna tema kekuningan
    final Color primaryYellow = Color(0xFFFFCC00);
    final Color secondaryYellow = Color(0xFFFFF5D6);
    final Color darkYellow = Color(0xFFD4A400);
    final Color textColor = Color(0xFF5C4D00);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 6,
                  decoration: BoxDecoration(
                    color: primaryYellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: secondaryYellow,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: primaryYellow.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nominal Top Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryYellow, width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: primaryYellow.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Fixed Prefix container with correct height and styling
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            height: 54, // Match the height of TextFormField
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: primaryYellow,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.5),
                                bottomLeft: Radius.circular(10.5),
                              ),
                            ),
                            child: Text(
                              'Rp',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: textColor,
                              ),
                            ),
                          ),
                          // Text field tanpa border
                          Expanded(
                            child: TextFormField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                border: InputBorder.none,
                                hintText: '0 Masukkan nominal top up',
                                hintStyle: TextStyle(color: Colors.grey),
                                errorStyle: TextStyle(
                                    height: 0), // Hide error text inside field
                              ),

                              // logic gwa matikan
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Masukkan nominal top up';
                              //   }
                              //   final amount = int.tryParse(
                              //       value.replaceAll(RegExp(r'[^\d]'), ''));
                              //   if (amount == null || amount <= 0) {
                              //     return 'Nominal harus lebih dari 0';
                              //   }
                              //   return null;
                              // },
                              // done

                              onChanged: (value) {
                                // Remove initial "0" when user starts typing
                                if (value.startsWith('0') && value.length > 1) {
                                  String newValue = value.substring(1);
                                  String formattedValue =
                                      _formatCurrency(newValue);
                                  _amountController.value = TextEditingValue(
                                    text: formattedValue,
                                    selection: TextSelection.collapsed(
                                        offset: formattedValue.length),
                                  );
                                } else {
                                  // Normal formatting for other cases
                                  String formattedValue =
                                      _formatCurrency(value);
                                  _amountController.value = TextEditingValue(
                                    text: formattedValue,
                                    selection: TextSelection.collapsed(
                                        offset: formattedValue.length),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Tanggal Transaksi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: primaryYellow),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: primaryYellow.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('dd MMMM yyyy').format(_selectedDate),
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                              ),
                            ),
                            Icon(
                              Icons.calendar_today,
                              color: darkYellow,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showBarcodeBottomSheet();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryYellow,
                    elevation: 3,
                    shadowColor: primaryYellow.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Selanjutnya',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class BarcodeBottomSheet extends StatelessWidget {
  const BarcodeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFFFCC00),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Scan Barcode',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Tunjukkan Kepada Admin Koperasi',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              'assets/image/top_up/qr.png', // Pastikan gambar barcode sudah ada
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFCC00),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Selesai',
                style: TextStyle(
                  color: Color(0xFF5C4D00),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
