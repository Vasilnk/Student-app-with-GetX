import 'package:flutter/material.dart';
import 'package:student_app/database/db_model.dart';
import 'package:student_app/getx%20controllers/students_controller.dart';
import 'package:student_app/screens/edit_page.dart';
import 'package:student_app/screens/student_profile.dart';
import 'package:get/get.dart';

class ListViewBuilder extends StatelessWidget {
  final List<StudentDBModel> students;
  const ListViewBuilder(this.students, {super.key});

  @override
  Widget build(BuildContext context) {
    StudentsController controller = Get.find();
    return ListView.separated(
      itemBuilder: (context, index) {
        final student = students[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 7),
          decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.only(top: 15),
          height: 100,
          child: ListTile(
            onTap: () {
              Get.to(ProfilePage(student.id));
            },
            title: Text(
              student.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage:
                  student.image != null ? MemoryImage(student.image!) : null,
              child: student.image == null ? const Icon(Icons.person) : null,
            ),
            subtitle: Text('Class: ${student.classNumber}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(EditStudentPage(student: student));
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.dialog(AlertDialog(
                      title: const Text('Confirm Delete'),
                      content: const Text(
                          'Are you sure you want to delete this student?'),
                      actions: [
                        TextButton(
                          child: const Text('No'),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            if (student.id != null) {
                              try {
                                controller.deleteStudent(student.id!);
                                Get.back();
                                Get.snackbar(
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  '',
                                  '${student.name} is deleted.',
                                );
                              } catch (e) {
                                Get.snackbar('', 'Failed to delete student.');
                                throw Exception("Error deleting student: $e");
                              }
                            } else {
                              Get.snackbar(
                                  '', 'Invalid student ID. Cannot delete');
                              throw Exception("Invalid student ID");
                            }
                          },
                        ),
                      ],
                    ));
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Color.fromARGB(253, 184, 55, 46),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 5,
        color: Colors.white,
      ),
      itemCount: students.length,
    );
  }
}
