import 'package:flutter/material.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final Color darkColor = const Color(0xFF0E0C1D);
  final Color accentColor = const Color(0xFF9C27B0); // Stylish purple
  final Color inputFillColor = const Color(0xFF1F1B2E); // Slightly lighter than background

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Login or Sign up',
                  style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Enter your mobile number',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixText: '+91 ',
                  prefixStyle: const TextStyle(color: Colors.white),
                  labelText: 'Mobile Number',
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: accentColor),
                  ),
                  filled: true,
                  fillColor: inputFillColor,
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Handle OTP logic
                },
                child: const Text(
                  'Send OTP',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.white30,
                    thickness: 1,
                    indent: 20,
                    endIndent: 10,
                  ),
                ),
                Text(
                  'OR',
                  style: TextStyle(color: Colors.white54, fontSize: 16),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white30,
                    thickness: 1,
                    indent: 10,
                    endIndent: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Google Login Button
            GestureDetector(
              onTap: () {
                // Google login
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white30),
                  borderRadius: BorderRadius.circular(13),
                  color: inputFillColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('asset/image/flat-color-icons_google.png', height: 30),
                    const SizedBox(width: 20),
                    const Text(
                      'Continue with Google',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Apple Login Button
            GestureDetector(
              onTap: () {
                // Apple login
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white30),
                  borderRadius: BorderRadius.circular(13),
                  color: inputFillColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('asset/image/ic_baseline-apple.png', height: 30),
                    const SizedBox(width: 20),
                    const Text(
                      'Continue with Apple',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'By tapping Continue with Apple or Google you agree to Social Monkey’s Terms of Use and Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
