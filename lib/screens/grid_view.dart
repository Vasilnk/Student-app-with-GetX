import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/database/db_model.dart';
import 'package:student_app/getx%20controllers/students_controller.dart';
import 'package:student_app/screens/edit_page.dart';

class GridViewBuilder extends StatelessWidget {
  final List<StudentDBModel> students;
  const GridViewBuilder(this.students, {super.key});

  @override
  Widget build(BuildContext context) {
    StudentsController controller = Get.find();

    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.9,
      ),
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];

        return Container(
          decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    student.image != null ? MemoryImage(student.image!) : null,
                child: student.image == null ? const Icon(Icons.person) : null,
              ),
              const SizedBox(height: 8),
              Text(
                student.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text('Class: ${student.classNumber}'),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      Get.dialog(
                        AlertDialog(
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
                                    Get.snackbar('deleted',
                                        '${student.name} is deleted.');
                                  } catch (e) {
                                    Get.snackbar(
                                        'error', 'Failed to delete student.');

                                    throw Exception(
                                        "Error deleting student: $e");
                                  }
                                } else {
                                  Get.snackbar('error',
                                      'Invalid student ID. Cannot delete.');

                                  throw Exception("Invalid student ID");
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(253, 184, 55, 46),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
