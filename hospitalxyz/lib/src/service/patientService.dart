// ignore_for_file: file_names, constant_identifier_names

import 'dart:convert' show json;
import 'package:hospitalxyz/src/models/patient.dart';

import '../models/patient.dart';
import 'package:http/http.dart' as http;

class PatientService {
  static const ADD_URL = 'https://192.168.0.52/hospital/Patient/addPatient.php';
  static const VIEW_URL = 'https://192.168.0.52/hospital/Patient/viewPatient.php';
  static const UPDATE_URL = 'https://192.168.0.52/hospital/Patient/updatePatient.php';
  static const DELETE_URL = 'https://192.168.0.52/hospital/Patient/deletePatient.php';

  Future<String> addPatient(Patient patient) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: patient.toJsonAdd());
    if (response.statusCode == 200) {
     // print("Add Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  List<Patient> patientFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Patient>.from(data.map((patient) => Patient.fromjson(patient)));
  }

  Future<List<Patient>> getPatient() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<Patient> list = patientFromJson(response.body);
      return list;
    } else {
      return <Patient>[];
    }
  }

  Future<String> updatePatient(Patient patient) async {
    final response =
        await http.post(Uri.parse(UPDATE_URL), body: patient.toJsonUpdate());
    if (response.statusCode == 200) {
      //print("Update Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  Future<String> deletePatient(Patient patient) async {
    final response =
        await http.post(Uri.parse(DELETE_URL), body: patient.toJsonUpdate());
    if (response.statusCode == 200) {
     // print("Delete Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }
}