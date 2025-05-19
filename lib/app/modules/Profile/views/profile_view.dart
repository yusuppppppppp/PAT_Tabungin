import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

// Fungsi Helper: Untuk membangun item summary
  Widget _buildSummaryItem({
    required String title,
    required double amount,
    required Color iconBackgroundColor,
    required IconData iconData,
  }) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Rp${_formatCurrency(amount)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

// Fungsi Helper: Untuk memformat angka menjadi format mata uang
  String _formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]}.',
        );
  }

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
                // Wave shadow
                Positioned(
                  top: 5, // Slightly shifted down from the original wave
                  left: 0,
                  right: 0,
                  child: CustomPaint(
                    painter: WaveShadowPainter(),
                    size: const Size(double.infinity, 285),
                  ),
                ),

                // Wave background
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 280,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFBBC04),
                    ),
                  ),
                ),

                // Avatar and Username
                Positioned(
                  top: 60,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Column(
                    children: [
                      // Avatar
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
                        child: GestureDetector(
                          onTap: () => _showAvatarOptions(context),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/image/profil/avatar.png'),
                          ),
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
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/image/profil/grafik1.png',
                        height: 210,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Summary Section
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildSummaryItem(
                              title: 'Uang Masuk',
                              amount: 300000, 
                              iconBackgroundColor: Colors.green,
                              iconData: Icons.arrow_downward,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 1,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          Expanded(
                            child: _buildSummaryItem(
                              title: 'Uang Keluar',
                              amount: 540000, 
                              iconBackgroundColor: Colors.orange,
                              iconData: Icons.arrow_upward,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),

            // Section Header
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
                      onPressed: () => _showEditInfoBottomSheet(context),
                      icon: const Icon(Icons.edit, color: Color(0xFFFFC107)),
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

  void _showAvatarOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(bottom: 12),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library,
                  color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text('Pilih dari Galeri'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Color(0xFFFBBC04)),
              title: const Text('Ambil Foto'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF252D66)),
              title: const Text('Logout'),
              onTap: () => Navigator.pushNamed(context, '/login-register'),
            ),
            ListTile(
              leading: const Icon(Icons.cancel, color: Colors.red),
              title: const Text('Batal'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan bottom sheet form edit info pribadi
  void _showEditInfoBottomSheet(BuildContext context) {
    // Inisialisasi controller untuk form
    final nameController =
        TextEditingController(text: 'Yusuf Satria Putra Pratama');
    final classController = TextEditingController(text: '9H');
    final phoneController = TextEditingController(text: '088235830336');
    final emailController =
        TextEditingController(text: 'gondetgendat@gmail.com');

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Memungkinkan modal untuk mengambil lebih banyak ruang
      backgroundColor: Colors
          .transparent, // Membuat background transparan supaya bisa custom
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).viewInsets.bottom, // Menghindari keyboard
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle untuk drag
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(bottom: 20),
                  ),
                ),

                // Judul form
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 8),
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
                        "Edit Informasi Pribadi",
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
                        icon: const Icon(Icons.edit_document),
                        color: const Color(0xFFFBBC04),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Form Fields
                // 1. Nama Lengkap
                _buildEditFormField(
                  context: context,
                  label: 'Nama Lengkap',
                  icon: Icons.person,
                  controller: nameController,
                  iconColor: const Color(0xFFFFC107),
                ),
                const SizedBox(height: 16),

                // 2. Kelas
                _buildEditFormField(
                  context: context,
                  label: 'Kelas',
                  icon: Icons.school,
                  controller: classController,
                  iconColor: const Color(0xFF1A237E),
                ),
                const SizedBox(height: 16),

                // 3. Nomor Telepon
                _buildEditFormField(
                  context: context,
                  label: 'Nomor Telepon',
                  icon: Icons.phone,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  iconColor: const Color.fromARGB(255, 13, 177, 16),
                ),
                const SizedBox(height: 16),

                // 4. Email
                _buildEditFormField(
                  context: context,
                  label: 'Email',
                  icon: Icons.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  iconColor: Colors.black,
                ),
                const SizedBox(height: 30),

                // Tombol Simpan dan Batal
                Row(
                  children: [
                    // Tombol Batal
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Batal',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Tombol Simpan
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // Implementasi logika simpan informasi
                          Navigator.pop(context);
                          // Tambahkan logika untuk memperbarui informasi di sini
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Color(0xFFFFC107),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Simpan Perubahan',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Extra padding untuk bottom area
                SizedBox(
                    height:
                        MediaQuery.of(context).padding.bottom > 0 ? 20 : 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk form field pada modal edit
  Widget _buildEditFormField({
    required BuildContext context,
    required String label,
    required IconData icon,
    required TextEditingController controller,
    Color iconColor = Colors.black,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: iconColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              hintStyle: TextStyle(color: const Color(0xFFBDBDBD)),
            ),
          ),
        ),
      ],
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
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: textColor, size: 20),
          ),
          const SizedBox(width: 12),

          // Label and Value
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isCompact ? 12 : 14,
                    color: textColor.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: isCompact ? 14 : 16,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Wave Clipper
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.75, size.height - 100, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Wave Shadow Painter
class WaveShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x66FFCC00)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.75, size.height - 100, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
