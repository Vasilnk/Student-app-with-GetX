import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/getx%20controllers/login_controller.dart';
import 'package:student_app/screens/login.dart';

logoutFunction() {
  return Get.dialog(
    AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            confirmLogout();
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}

void confirmLogout() async {
  LoginController controller = Get.find();

  controller.logout();
  Get.offAll(LoginPage());
}
