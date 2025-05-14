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
              height: 370.0, // Mengurangi tinggi dari 350 ke 300
              child: Stack(
                children: [
                  // Latar belakang
                  Container(
                    height: 370.0, // Mengurangi tinggi agar sesuai dengan SizedBox
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
                    top: 50, // Mengurangi jarak dari atas
                    left: 70,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          'assets/image/register/Group 4.png', // Path gambar
                          height: 300, // Mengurangi ukuran gambar dari 250 ke 220
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Form registrasi - dibuat lebih kecil
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0), // Mengurangi padding vertical
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Input Username
                  const Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 15.0, // Ukuran font lebih kecil
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4.0), // Jarak lebih kecil
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Username here",
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 11.0), // Font hint lebih kecil
                      filled: true,
                      fillColor: const Color(0xFFFFF9C4),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Padding dalam input lebih kecil
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), // Border radius lebih kecil
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                    ),
                    style: const TextStyle(fontSize: 13.0), // Ukuran teks input lebih kecil
                  ),
                  const SizedBox(height: 10.0), // Jarak antar field lebih kecil
                  
                  // Input Email
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 15.0, // Ukuran font lebih kecil
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4.0), // Jarak lebih kecil
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Email here",
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 11.0), // Font hint lebih kecil
                      filled: true,
                      fillColor: const Color(0xFFFFF9C4),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Padding dalam input lebih kecil
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), // Border radius lebih kecil
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.amber),
                      ),
                    ),
                    style: const TextStyle(fontSize: 13.0), // Ukuran teks input lebih kecil
                  ),
                  const SizedBox(height: 10.0), // Jarak antar field lebih kecil
                  
                  // Input Password
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15.0, // Ukuran font lebih kecil
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4.0), // Jarak lebih kecil
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your Password here",
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 11.0), // Font hint lebih kecil
                      filled: true,
                      fillColor: const Color(0xFFFFF9C4),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Padding dalam input lebih kecil
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), // Border radius lebih kecil
                        borderSide: const BorderSide(color: Color(0xFFFFC107)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xFFFFC107)),
                      ),
                    ),
                    style: const TextStyle(fontSize: 13.0), // Ukuran teks input lebih kecil
                  ),
                  const SizedBox(height: 30.0),
                  
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
                      padding: const EdgeInsets.symmetric(vertical: 10.0), // Tinggi tombol lebih kecil
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0, // Font pada tombol lebih kecil
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0), // Jarak lebih kecil
                  
                  // Teks untuk login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sudah punya akun ? ",
                        style: TextStyle(color: Colors.black, fontSize: 12.0), // Font lebih kecil
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
                            fontSize: 12.0, // Font lebih kecil
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