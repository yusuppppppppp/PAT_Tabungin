import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart'; // Mengimpor file app_pages.dart
import 'app/widgets/splash_screen.dart';
import 'package:test/app/modules/login-register/views/login_register_view.dart';
import 'package:test/app/modules/welcome_page/views/welcome_page_view.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
