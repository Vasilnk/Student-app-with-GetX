import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/getx%20controllers/login_controller.dart';

// ignore: must_be_immutable
class SchoolProfileScreen extends StatelessWidget {
  const SchoolProfileScreen({super.key});

  final TextStyle titleStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final TextStyle detailStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 226, 224, 224),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/school.jpeg'),
                  child: null,
                ),
                const SizedBox(height: 40),
                Center(
                  child: Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("School ID", style: titleStyle),
                              Text(controller.schoolId ?? "N/A",
                                  style: detailStyle),
                            ]),
                        const Divider(
                          color: Colors.grey,
                          height: 30,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("School Name", style: titleStyle),
                            Text(controller.schoolName ?? "N/A",
                                style: detailStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
