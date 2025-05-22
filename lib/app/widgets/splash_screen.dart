import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    // Inisialisasi AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // Inisialisasi animasi lingkaran (dimulai setelah delay kecil)
    _circleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.7, curve: Curves.fastOutSlowIn),
    ));

    // Inisialisasi animasi fade untuk logo
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
    ));

    // Mulai animasi setelah widget selesai build
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _controller.forward();
      }
    });

    // Navigasi ke halaman berikutnya
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Get.offNamed(Routes.WELCOME_PAGE);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final maxRadius = math.sqrt(
      math.pow(screenSize.width, 2) + math.pow(screenSize.height, 2)
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFB300),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              // Background kuning (selalu ada)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color(0xFFFFB300),
              ),

              // Animasi lingkaran putih yang membesar
              if (_circleAnimation.value > 0)
                ClipPath(
                  clipper: CircleClipper(
                    radius: _circleAnimation.value * maxRadius,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                  ),
                ),

              // Logo dengan animasi fade
              Center(
                child: Opacity(
                  opacity: _fadeAnimation.value,
                  child: SizedBox(
                    width: screenSize.width * 0.4,
                    height: screenSize.width * 0.4,
                    child: Image.asset(
                      "assets/image/splash_screen/tabungin.png",
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback jika gambar tidak ditemukan
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'LOGO',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Custom Clipper untuk memotong widget dengan lingkaran
class CircleClipper extends CustomClipper<Path> {
  final double radius;

  CircleClipper({required this.radius});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    ));
    return path;
  }

  @override
  bool shouldReclip(covariant CircleClipper oldClipper) {
    return oldClipper.radius != radius;
  }
}