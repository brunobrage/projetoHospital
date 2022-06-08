// ignore_for_file: file_names, constant_identifier_names

import 'dart:convert' show json;
import '../models/student.dart';
import 'package:http/http.dart' as http;

class StudentService {
  static const ADD_URL = 'https://192.168.0.52/hospital/Student/addStudent.php';
  static const VIEW_URL = 'https://192.168.0.52/hospital/Student/viewStudent.php';
  static const UPDATE_URL = 'https://192.168.0.52/hospital/Student/updateStudent.php';
  static const DELETE_URL = 'https://192.168.0.52/hospital/Student/deleteStudent.php';

  Future<String> addStudent(Student student) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: student.toJsonAdd());
    if (response.statusCode == 200) {
     // print("Add Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  List<Student> studentFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Student>.from(data.map((student) => Student.fromjson(student)));
  }

  Future<List<Student>> getStudent() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<Student> list = studentFromJson(response.body);
      return list;
    } else {
      return <Student>[];
    }
  }

  Future<String> updateStudent(Student student) async {
    final response =
        await http.post(Uri.parse(UPDATE_URL), body: student.toJsonUpdate());
    if (response.statusCode == 200) {
      //print("Update Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  Future<String> deleteStudent(Student student) async {
    final response =
        await http.post(Uri.parse(DELETE_URL), body: student.toJsonUpdate());
    if (response.statusCode == 200) {
     // print("Delete Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }
}