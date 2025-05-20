import 'package:flutter/material.dart';
import 'package:tabungin/app/modules/home/views/home_view.dart';
import 'package:tabungin/app/modules/lupa_pw/views/lupa_pw_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  void _showGoogleAccountSelectionPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: const Column(
                children: [
                  Icon(Icons.account_circle, size: 40.0, color: Colors.amber),
                  SizedBox(height: 8.0),
                  Text(
                    "Choose an account",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "to continue to Company",
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Text("S", style: TextStyle(color: Colors.white)),
              ),
              title: Text("Still_water"),
              subtitle: Text("Still_water@gmail.com"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text("M", style: TextStyle(color: Colors.white)),
              ),
              title: Text("Manggo"),
              subtitle: Text("Manggo@gmail.com"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Use another account"),
              onTap: () {
                Navigator.of(context).pop();
                // Simulate another account selection
              },
            ),
          ],
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "To continue, Google will share your name, email address, language preference, and profile picture with Company.",
              style: TextStyle(fontSize: 12.0, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: Color(0xFFFFC300),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset(
                      'assets/image/login/login.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 1.0),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7, // Reduced width to 70% of screen
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your Email here",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 11.0), // Smaller hint text
                        filled: true,
                        fillColor: Color(0xFFFFF9C4),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Smaller padding
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: const Color(0xFFFFC107)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: const Color(0xFFFFC107)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7, // Reduced width to 70% of screen
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter your Password here",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 11.0), // Smaller hint text
                        filled: true,
                        fillColor: Color(0xFFFFF9C4),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Smaller padding
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: const Color(0xFFFFC107)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: const Color(0xFFFFC107)),
                        ),
                      ),
                    ),
                  ),
                  // Menambahkan teks Lupa Password di bagian kanan
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LupaPwView()),
                        );
                      },
                      child: const Text(
                        "Lupa Password?",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF252D70),
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () => _showGoogleAccountSelectionPopup(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sign in with Google",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Image.asset(
                          'assets/icon/login/web_light_rd_na.png',
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