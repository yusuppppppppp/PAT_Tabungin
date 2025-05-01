import 'package:flutter/material.dart';
import 'dart:math' as math; // Untuk perhitungan radius lingkaran
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
  late Animation<double> _animation;
  late Animation<double> _fadeAnimation;
  bool _animationInitialized = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;

      // Inisialisasi AnimationController
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
      );

      // Inisialisasi animasi radius lingkaran
      _animation = Tween<double>( 
        begin: 0,
        end: math.sqrt(math.pow(screenSize.width, 2) + math.pow(screenSize.height, 2)),
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

      // Inisialisasi animasi fade (opacity)
      _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );

      // Mulai animasi
      _controller.forward();

      // Navigasi ke halaman berikutnya setelah animasi selesai
      Future.delayed(const Duration(seconds: 5), () {
        Get.offNamed(Routes.WELCOME_PAGE);
      });

      setState(() {
        _animationInitialized = true;
      });
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
        Container(color: const Color.fromARGB(255, 255, 255, 255)),

        // Render animasi lingkaran dan fade hanya jika sudah diinisialisasi
        if (_animationInitialized)
          AnimatedBuilder(
            animation: Listenable.merge([_animation, _fadeAnimation]),
            builder: (context, child) {
              return Stack(
                children: [
                  ClipPath(
                    clipper: CircleClipper(radius: _animation.value),
                    child: Container(color: Colors.white),
                  ),
                  Opacity(
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
                  ),
                ],
              );
            },
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
