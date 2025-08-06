import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'otpscreen.dart';


class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {

  final Color darkColor = const Color(0xFF0E0C1D);
  final Color accentColor = const Color(0xFF9C27B0);
  final Color inputFillColor = const Color(0xFF1F1B2E);
  final TextEditingController _controller = TextEditingController();

  // void sendOTP() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '+91${_controller.text.trim()}',
  //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     verificationFailed: (FirebaseAuthException e) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? "Error")));
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Otpscreen(verificationId: verificationId),
  //         ),
  //       );
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(width: 200,height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'asset/image/removedbg.png',
                  height: 20,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 50),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Login or Sign up',
                  style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Enter your mobile number',
                  style: TextStyle(color: Colors.white70, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixText: '+91 ',
                  labelText: 'Mobile Number',
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: inputFillColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  Otpscreen(verificationId: '',)));
                },
                child: const Text('Send OTP', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),SizedBox(height: 20,),
             TextButton(
              onPressed: null,
              child: Text('Signup', style: TextStyle(color: Colors.amber,
              fontSize: 16)),
                         ),
            
            
 Padding(
   padding: const EdgeInsets.symmetric(horizontal: 20),
   child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                      indent: 20,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                      indent: 10,
                      endIndent: 20,
                    ),
                  ),
                ],
              ),
 ),
            SizedBox(height: 60),
            Container(
              width: 450,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(13)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/image/flat-color-icons_google.png', height: 40),
                  SizedBox(width: 20),
                  Text(
                    'Continue with Google',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
             width: 450,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(13)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/image/ic_baseline-apple.png', height: 40),
                  SizedBox(width: 20),
                  Text(
                    'Continue with Apple',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),),
              SizedBox(height: 50,)

          ],
        ),
      ),
    );
  }
}
