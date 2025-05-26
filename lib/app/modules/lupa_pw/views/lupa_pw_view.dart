import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/lupa_pw_controller.dart';
import 'package:tabungin/app/modules/reset_pw/views/reset_pw_view.dart';

class LupaPwView extends GetView<LupaPwController> {
  const LupaPwView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/lupa_pw/bg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 117,
                          left: 30,
                          child: Image.asset(
                            'assets/image/lupa_pw/lupa_pw.png',
                            fit: BoxFit.contain,
                            height: 300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Form fields
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 310,
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF9C4),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xFFFFC107), width: 1),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your Username here',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 11),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 16),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 310,
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF9C4),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xFFFFC107), width: 1),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your recovery email here',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 11),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 17),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 80),

                        // Next button
                        Center(
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ResetPwView()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF252D70),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'NEXT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
