import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/getx%20controllers/login_controller.dart';
import 'package:student_app/screens/logout.dart';
import 'package:student_app/utils.dart';

class DrowerScreen extends StatelessWidget {
  DrowerScreen({
    super.key,
  });

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();

    return Drawer(
      key: scaffoldKey,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/school.jpeg'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.schoolName ?? 'No name added',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = Utils.sidePanelItems[index];
                  return ListTile(
                    leading: Icon(item['icon']),
                    title: Text(item['title']),
                    onTap: () {
                      if (index == 1) {
                        logoutFunction();
                      } else {
                        Get.to(item['screen']);
                      }
                    },
                  );
                },
                itemCount: Utils.sidePanelItems.length,
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
