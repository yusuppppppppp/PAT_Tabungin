import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart'; // Mengimpor file app_pages.dart
import 'app/widgets/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 4)),
      builder: (context, snapshot) {
        // Menunggu future selesai
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();     
        } else {
           return GetMaterialApp(
          title: 'Tabungin',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          initialRoute: Routes.WELCOME_PAGE,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
         );
        }
      },
    );
  }
}