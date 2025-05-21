import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/reset_pw_controller.dart';
import 'package:tabungin/app/modules/login/views/login_view.dart';

class ResetPwView extends GetView<ResetPwController> {
  const ResetPwView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent status bar
        statusBarIconBrightness: Brightness.dark, // Dark icons for light background
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: GestureDetector(
          // Hide keyboard when tapping outside of input fields
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              // Scrollable content with bouncing physics
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Yellow background section with illustration
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.45, // Reduced height
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFC300), // Bright yellow background color
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 70, // Adjusted position
                            left: 75,
                            child: Image.asset(
                              'assets/image/reset_pw/reset_pw.png',
                              height: 280, // Reduced image size
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),

                    // White background form section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          // New Password Field
                          const Text(
                            'New Password',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            height: 50, // Reduced height
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Enter your new password here',
                                hintStyle: const TextStyle(color: Colors.grey, fontSize: 11),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 13), // Smaller padding
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFD000), width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFD000), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFD000), width: 2),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFFFF9C4),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20), // Reduced spacing

                          // Confirm New Password Field
                          const Text(
                            'Confirm New Password',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            height: 50, // Reduced height
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Enter your confirm new password here',
                                hintStyle: const TextStyle(color: Colors.grey, fontSize: 11),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12), // Smaller padding
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFD000), width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFD000), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFD000), width: 2),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFFFF9C4),
                              ),
                            ),
                          ),

                          const SizedBox(height: 80), // Reduced spacing

                          // Confirm Button
                          SizedBox(
                            width: double.infinity,
                            height: 50, // Reduced button height
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFF1E2C6B), // Dark blue button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginView()),
                                );
                              },
                              child: const Text(
                                'CONFIRM',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Adjust padding for keyboard visibility
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}