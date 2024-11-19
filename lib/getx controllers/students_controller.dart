// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:student_app/database/db_model.dart';

// class StudentsProvider with ChangeNotifier {
//   Box<StudentDBModel> studentBox = Hive.box<StudentDBModel>('students');

//   List<StudentDBModel> get students => studentBox.values.toList();

//   void addStudent(StudentDBModel student) async {
//     final id = await studentBox.add(student);
//     student.id = id;
//     notifyListeners();
//   }

//   void updateStudent(StudentDBModel updateStudent) {
//     final id = updateStudent.id;
//     studentBox.put(id, updateStudent);
//     notifyListeners();
//   }

//   void deleteStudent(int id) async {
//     await studentBox.delete(id);
//     notifyListeners();
//   }

//   StudentDBModel? getStudent(String id) => studentBox.get(id);
// }

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:student_app/database/db_model.dart';

class StudentsController extends GetxController {
  late Box<StudentDBModel> studentBox;

  final students = <StudentDBModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    studentBox = Hive.box<StudentDBModel>('students');
    loadStudents();
  }

  void loadStudents() {
    students.value = studentBox.values.toList();
  }

  void addStudent(StudentDBModel student) async {
    final id = await studentBox.add(student);
    student.id = id;
    students.add(student);
  }

  void updateStudent(StudentDBModel updatedStudent) {
    studentBox.put(updatedStudent.id, updatedStudent);
    loadStudents();
  }

  void deleteStudent(int id) async {
    await studentBox.delete(id);
    loadStudents();
  }

  StudentDBModel? getStudent(int id) => studentBox.get(id);
}
