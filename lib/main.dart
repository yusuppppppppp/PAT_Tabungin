import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart'; // Mengimpor app_pages.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tabungin', // Nama aplikasi
      theme: ThemeData(
        primarySwatch: Colors.amber, // Warna utama tema
      ),
      initialRoute: Routes.SPLASH_SCREEN, // Tetap menggunakan rute SPLASH_SCREEN
      getPages: AppPages.routes, // Daftar rute diambil dari AppPages
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
    );
  }
}
