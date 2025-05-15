import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with avatar and wave background
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Wave shadow (slightly shifted down)
                Positioned(
                  top: 5, // Slightly shifted down from the original wave
                  left: 0,
                  right: 0,
                  child: CustomPaint(
                    painter: WaveShadowPainter(),
                    size: const Size(double.infinity, 285), // Slightly taller to account for shadow
                  ),
                ),
                
                // Wave background
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 280,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFBBC04), // Warna oranye dari kode asli
                    ),
                  ),
                ),

                // Avatar and Username
                Positioned(
                  top: 60,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Column(
                    children: [
                      // Avatar dengan border yang lebih menarik
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/image/profil/avatar.png'),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Username
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Alvaretttt',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 7,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Grafik dengan tampilan yang lebih baik
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/image/profil/grafik1.png',
                    height: 210,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Tombol Expenses dengan desain yang lebih menarik
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 12),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    elevation: 4,
                  ),
                  icon: const Icon(
                    Icons.compare_arrows,
                    color: Color(0xFFFFC107),
                    size: 20,
                  ),
                  label: const Text(
                    'Expenses',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            // Section header
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
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
                      "Informasi Pribadi",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      icon:
                          const Icon(Icons.edit, color: Color(0xFFFFC107)),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // User info cards dengan desain yang lebih compact
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Nama (full width)
                  _buildCompactInfoCard(
                    'Nama Lengkap',
                    'Yusuf Satria Putra Pratama',
                    Icons.person,
                    const Color(0xFFFFC107),
                    Colors.black,
                  ),

                  const SizedBox(height: 10),

                  // Baris untuk Kelas dan Telepon
                  Row(
                    children: [
                      // Kelas - 40% width
                      Expanded(
                        flex: 4,
                        child: _buildCompactInfoCard(
                          'Kelas',
                          '9H',
                          Icons.school,
                          const Color(0xFF1A237E),
                          Colors.white,
                          isCompact: true,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Telepon - 60% width
                      Expanded(
                        flex: 6,
                        child: _buildCompactInfoCard(
                          'Telepon',
                          '088235830336',
                          Icons.phone,
                          Colors.white,
                          Colors.black,
                          hasBorder: true,
                          isCompact: true,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Email (full width)
                  _buildCompactInfoCard(
                    'Email',
                    'gondetgendat@gmail.com',
                    Icons.email,
                    const Color.fromARGB(255, 0, 0, 0),
                    Colors.white,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactInfoCard(
    String label,
    String value,
    IconData icon,
    Color backgroundColor,
    Color textColor, {
    bool hasBorder = false,
    bool isCompact = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: isCompact ? 12 : 16, vertical: isCompact ? 10 : 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: hasBorder
            ? Border.all(color: Colors.grey.shade300, width: 1.5)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon container
          Container(
            padding: EdgeInsets.all(isCompact ? 6 : 8),
            decoration: BoxDecoration(
              color: textColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: textColor,
              size: isCompact ? 16 : 20,
            ),
          ),

          SizedBox(width: isCompact ? 8 : 12),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label
                Text(
                  label,
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                // Value - with auto overflow ellipsis
                Text(
                  value,
                  style: TextStyle(
                    color: textColor,
                    fontSize: isCompact ? 12 : 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
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

// Custom Painter for Wave Shadow
class WaveShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create the same path as the wave clipper
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 50);
    path.quadraticBezierTo(
        3 * size.width / 4, size.height - 100, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    
    // Create a shadow-like effect with paint
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.15)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    
    // Draw the shadow under the path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}