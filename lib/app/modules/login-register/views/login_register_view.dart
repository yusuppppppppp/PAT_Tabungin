import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:tabungin/app/modules/login/views/login_view.dart'; // Pastikan impor file yang berisi LoginView
import 'package:tabungin/app/modules/register/views/register_view.dart'; // Impor file RegisterView

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({super.key});

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
                      'assets/image/login-register/register-login.png',
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
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 18,
                      offset: Offset(0, -7),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF252D70),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterView(),
                                  ),
                                );
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
