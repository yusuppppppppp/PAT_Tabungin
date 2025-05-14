import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with avatar and background
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Background with wave design
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 280,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/profil/bg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Avatar
                Positioned(
                  top: 60,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/image/profil/avatar.png'),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFBBC04),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Alvaretttt',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            // Grafik tanpa container
            Stack(
              children: [
                Image.asset(
                  'assets/image/profil/grafik1.png',
                  height: 210,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            // Tombol Expenses di bawah grafik
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                  ),
                  icon: const Icon(
                    Icons.compare_arrows,
                    color: Colors.yellow,
                  ),
                  label: const Text(
                    'expenses',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // User info section - Modified to match exact layout in the image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // First row - Name and Edit button
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoPill(
                          'Nama : Yusuf Satria P. P.',
                          const Color(0xFFFFC107), // Amber/yellow color
                          false,
                        ),
                      ), 
                      const SizedBox(width: 12),
                      // Edit icon button (black circle)
                      Container(
                        width: 48,   
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Color(0xFFFFC107), // Yellow icon
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Second row - Class
                  _buildInfoPill(
                    'Kelas : 9h',
                    const Color(0xFF1A237E), // Indigo dark color
                    false,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Third row - Hobby
                  _buildInfoPill(
                    'Hobi : Bersepeda',
                    Colors.black,
                    false,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Fourth row - Phone number
                  _buildInfoPill(
                    'Nomor : 088235830336',
                    Colors.white,
                    false,
                    hasBorder: true,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Fifth row - Email
                  _buildInfoPill(
                    'Email : gondetgendat@gmail.com',
                    const Color(0xFF1A237E), // Indigo dark color
                    false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoPill(String text, Color backgroundColor, bool showEditIcon, {bool hasBorder = false}) {
    // Determine text color based on background color brightness
    Color textColor = backgroundColor == Colors.black ? Colors.white : Colors.black;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
        border: hasBorder ? Border.all(color: Colors.grey.shade300) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}

// Custom Clipper for Wave Background
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 50);
    path.quadraticBezierTo(
        3 * size.width / 4, size.height - 100, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}