// ignore_for_file: file_names, constant_identifier_names

import 'dart:convert' show json;
import '../models/doctor.dart';
import 'package:http/http.dart' as http;

class DoctorService {
  static const ADD_URL = 'https://192.168.0.52/hospital/Doctors/addDoctor.php';
  static const VIEW_URL = 'https://192.168.0.52/hospital/Doctors/viewDoctor.php';
  static const UPDATE_URL = 'https://192.168.0.52/hospital/Doctors/updateDoctor.php';
  static const DELETE_URL = 'https://192.168.0.52/hospital/Doctors/deleteDoctor.php';

  Future<String> addDoctor(Doctor doctor) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: doctor.toJsonAdd());
    if (response.statusCode == 200) {
     // print("Add Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  List<Doctor> doctorFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Doctor>.from(data.map((doctor) => Doctor.fromjson(doctor)));
  }

  Future<List<Doctor>> getDoctor() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<Doctor> list = doctorFromJson(response.body);
      return list;
    } else {
      return <Doctor>[];
    }
  }

  Future<String> updateDoctor(Doctor doctor) async {
    final response =
        await http.post(Uri.parse(UPDATE_URL), body: doctor.toJsonUpdate());
    if (response.statusCode == 200) {
      //print("Update Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  Future<String> deleteDoctor(Doctor doctor) async {
    final response =
        await http.post(Uri.parse(DELETE_URL), body: doctor.toJsonUpdate());
    if (response.statusCode == 200) {
     // print("Delete Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }
}