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
            // Bagian atas dengan gambar menggunakan Stack dan Positioned
            SizedBox(
              height: 350.0, // Atur tinggi dengan nilai tetap
              child: Stack(
                children: [
                  // Latar belakang
                  Container(
                    height: 350.0, // Atur tinggi agar sesuai dengan SizedBox
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFC300), // Warna kuning
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(230.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // Warna bayangan
                          offset: Offset(0, 4), // Posisi bayangan (x, y)
                          blurRadius: 10.0, // Penyebaran bayangan
                          spreadRadius: 1.0, // Jangkauan bayangan
                        ),
                      ],
                    ),
                  ),
                  // Gambar di atas latar belakang
                  Positioned(
                    top: 70,
                    left: 70,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          'assets/image/register/Group 4.png', // Path gambar
                          height: 250, // Ukuran gambar
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Form registrasi
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Input Username
                  const Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Username here",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFFFFF9C4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Input Email
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Email here",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFFFFF9C4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Input Password
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your Password here",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFFFFF9C4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Tombol REGISTER
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman LoginView
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF252D70),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Teks untuk login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sudah punya akun ? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman LoginView
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
