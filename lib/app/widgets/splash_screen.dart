import 'package:flutter/material.dart';
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
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Inisialisasi animasi fade (opacity)
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Mulai animasi
    _controller.forward();

    // Navigasi ke halaman berikutnya setelah animasi selesai
    Future.delayed(const Duration(seconds: 4), () {
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
        // Background putih
        Container(color: const Color.fromARGB(255, 255, 255, 255)),

        // Animasi fade untuk logo
        AnimatedBuilder(
          animation: _fadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset(
                    "assets/image/splash_screen/tabungin.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
