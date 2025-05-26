import 'package:flutter/material.dart';
import 'package:tabungin/app/modules/login-register/views/login_register_view.dart'; 

class WelcomePageView extends StatelessWidget {
  const WelcomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFFFC300), 
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin:
                  const EdgeInsets.only(bottom: 10), 
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, 
                    offset: Offset(0, 5), 
                    blurRadius: 10, 
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
                          child: const Icon(
                            Icons.arrow_forward_rounded, 
                            size: 32, 
                            color: Colors.black, 
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/image/awalan/Group6.png', 
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
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 10), 
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 5, 
                  margin: EdgeInsets.symmetric(
                      horizontal: 120), 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), 
                  ),
                ),
                SizedBox(
                    height: 30), 
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 14),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.7, 
                  child: const Text(
                    'Tabungin adalah aplikasi yang membantu para siswa SMPN 7 Malang menyisihkan uang saku mereka untuk masa depan yang lebih cerah. Aplikasi ini berperan sebagai sarana atau perantara tabungan bagi siswa.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        70), 
                const Align(
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
