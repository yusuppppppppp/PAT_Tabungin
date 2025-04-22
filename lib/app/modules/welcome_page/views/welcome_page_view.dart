import 'package:flutter/material.dart';
import 'package:tabungin/app/modules/login-register/views/login_register_view.dart'; // Pastikan impor file yang berisi LoginRegisterView

class WelcomePageView extends StatelessWidget {
  const WelcomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC300), // Warna kuning sebagai background
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 10), // Menambah margin bawah
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Warna bayangan
                    offset: Offset(0, 5), // Arah bayangan
                    blurRadius: 10, // Radius bayangan
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginRegisterPage(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_forward, size: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/image/awalan/Group6.png', // Tambahkan gambar ini ke folder assets
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Mengurangi padding vertikal
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 5, // Ketebalan divider
                  margin: EdgeInsets.symmetric(horizontal: 120), // Indentasi kiri dan kanan
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), // Radius border
                  ),
                ),
                SizedBox(height: 30), // Menambahkan lebih banyak ruang sebelum teks
                Text(
                  'Selamat Datang di Tabungin',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'Tabungin adalah aplikasi yang membantu para siswa SMPN 7 Malang menyisihkan uang saku mereka untuk masa depan yang lebih cerah. Aplikasi ini berperan sebagai sarana atau perantara tabungan bagi siswa.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 70), // Memberi lebih banyak ruang antara teks dan bagian bawah
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'By Alvarettt',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}