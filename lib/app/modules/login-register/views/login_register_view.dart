import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LoginRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset(
                      'assets/image/login-register/login-register.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFC300),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Warna bayangan
                      spreadRadius: 1, // Jangkauan bayangan
                      blurRadius: 18, // Tingkat keburaman bayangan
                      offset: Offset(0, -7), // Posisi bayangan (horizontal, vertical)
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to Login Page
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF252D70), // Warna tombol login
                        padding: EdgeInsets.symmetric(
                          vertical: 13.0,
                          horizontal: 115,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    RichText(
                      text: TextSpan(
                        text: 'Belum punya akun? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                        children: [
                          TextSpan(
                            text: 'Register disini',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to Register Page
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
