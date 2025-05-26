import 'package:flutter/material.dart';
import 'package:tabungin/app/modules/login/views/login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 370.0, 
              child: Stack(
                children: [
                  Container(
                    height: 370.0, 
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFC300), 
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(230.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, 
                          offset: Offset(0, 4), 
                          blurRadius: 10.0, 
                          spreadRadius: 1.0, 
                        ),
                      ],
                    ),
                  ),
                  
                  Positioned(
                    top: 50, 
                    left: 70,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          'assets/image/register/Group 4.png', 
                          height: 300, 
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Input Username
                  const Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 15.0, 
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4.0), 
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Username here",
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 11.0), 
                      filled: true,
                      fillColor: const Color(0xFFFFF9C4),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), 
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                    ),
                    style: const TextStyle(fontSize: 13.0), 
                  ),
                  const SizedBox(height: 10.0), 
                  
                  // Input Email
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 15.0, 
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4.0), 
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Email here",
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 11.0), 
                      filled: true,
                      fillColor: const Color(0xFFFFF9C4),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), 
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                    ),
                    style: const TextStyle(fontSize: 13.0), 
                  ),
                  const SizedBox(height: 10.0), 
                  
                  // Input Password
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15.0, 
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4.0), 
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your Password here",
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 11.0), 
                      filled: true,
                      fillColor: const Color(0xFFFFF9C4),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), 
                        borderSide: const BorderSide(color: Color(0xFFFFC107)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xFFFFC107)),
                      ),
                    ),
                    style: const TextStyle(fontSize: 13.0), 
                  ),
                  const SizedBox(height: 30.0),
                  
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF252D70),
                      padding: const EdgeInsets.symmetric(vertical: 10.0), 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0), 
                  
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sudah punya akun ? ",
                        style: TextStyle(color: Colors.black, fontSize: 12.0), 
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginView()),
                          );
                        },
                        child: const Text(
                          "Login disini",
                          style: TextStyle(
                            color: Color(0xFFFFC300),
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0, 
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}