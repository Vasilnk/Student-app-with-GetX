import 'package:flutter/material.dart';
import 'package:student_app/getx%20controllers/login_controller.dart';
import 'package:student_app/screens/home_page.dart';
import 'package:get/get.dart';
import 'package:student_app/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  LoginController controller = Get.find();

  void _checkIfLoggedIn() async {
    await Future.delayed(const Duration(seconds: 3));
    await controller.checkIfLoggedIn();
    final isLoggedIn = controller.isLoggedIn;

    if (isLoggedIn) {
      Get.offAll(const HomePage());
    } else {
      Get.off(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 110,
                height: 110,
                child: Image.asset('assets/images/images-modified.png')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'My School',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontFamily: 'DelaGothicOne',
                  fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
