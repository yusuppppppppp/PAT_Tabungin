import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Memastikan layar bisa disesuaikan dengan keyboard
      backgroundColor: Colors.white, // Warna latar belakang menjadi putih
      body: SingleChildScrollView( // Membungkus seluruh layar agar bisa di-scroll
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6, // Bagian atas (40% tinggi layar)
              decoration: BoxDecoration(
                color: Color(0xFFFFC300),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Warna bayangan
                    offset: Offset(0, 5), // Arah bayangan
                    blurRadius: 10, // Radius bayangan
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset(
                      'assets/image/login/login.png', // Ganti dengan path gambar Anda
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16.0), // Memberikan sedikit ruang sebelum input Email
                  // Input Email
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Email here",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xFFFFE082), // Warna field
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: const Color.fromARGB(255, 21, 27, 69)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Input Password
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your Password here",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xFFFFE082), // Warna field
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: const Color.fromARGB(255, 21, 27, 69)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // Tombol LOGIN
                  ElevatedButton(
                    onPressed: () {
                      // Logika login
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF252D70),
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Teks "Sign in with Google"
                  TextButton(
                    onPressed: () {
                      // Logika Sign in with Google
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign in with Google",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8.0), // Jarak antara teks dan ikon
                        Image.asset(
                          'assets/icon/login/web_light_rd_na.png', // Ganti dengan path ikon Anda
                          width: 24.0,
                          height: 24.0,
                        ),
                      ],
                    ),
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
