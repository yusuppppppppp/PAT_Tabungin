import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math; // Untuk perhitungan radius lingkaran
import '../routes/app_pages.dart'; // Akses ke route SPLASH_SCREEN

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Durasi animasi
    );

    // Animasi tween untuk radius lingkaran
    _animation = Tween<double>(
      begin: 0,
      end: math.sqrt(math.pow(Get.width, 2) + math.pow(Get.height, 2)),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Mulai animasi
    _controller.forward();

    // Navigasi ke halaman berikutnya setelah animasi selesai
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.WELCOME_PAGE);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background kuning awal
        Container(color: const Color(0xFFFFC300)),

        // Animasikan lingkaran yang membesar
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ClipPath(
              clipper: CircleClipper(radius: _animation.value),
              child: Container(color: Colors.white),
            );
          },
        ),

        // Konten splash screen
        Center(
          child: SizedBox(
            width: Get.width * 0.5,
            height: Get.width * 0.5,
            child: Image.asset("assets/image/splash_screen/tabungin.png"),
          ),
        ),
      ],
    );
  }
}

// Custom Clipper untuk memotong widget dengan lingkaran
class CircleClipper extends CustomClipper<Path> {
  final double radius;

  CircleClipper({required this.radius});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2), // Titik tengah layar
      radius: radius, // Radius lingkaran
    ));
    return path;
  }

  @override
  bool shouldReclip(covariant CircleClipper oldClipper) {
    return oldClipper.radius != radius; // Reclip jika radius berubah
  }
}
