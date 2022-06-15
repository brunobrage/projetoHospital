// ignore_for_file: file_names, constant_identifier_names

import 'dart:convert' show json;
import '../models/surgery.dart';
import 'package:http/http.dart' as http;

class SurgeryService {
  static const ADD_URL = 'https://192.168.0.52/hospital/Surgery/addSurgery.php';
  static const VIEW_URL = 'https://192.168.0.52/hospital/Surgery/viewSurgery.php';
  static const UPDATE_URL = 'https://192.168.0.52/hospital/Surgery/updateSurgery.php';
  static const DELETE_URL = 'https://192.168.0.52/hospital/Surgery/deleteSurgery.php';

  Future<String> addSurgery(Surgery surgery) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: surgery.toJsonAdd());
    if (response.statusCode == 200) {
     // print("Add Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  List<Surgery> surgeryFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Surgery>.from(data.map((surgery) => Surgery.fromjson(surgery)));
  }

  Future<List<Surgery>> getSurgery() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<Surgery> list = surgeryFromJson(response.body);
      return list;
    } else {
      return <Surgery>[];
    }
  }

  Future<String> updateSurgery(Surgery surgery) async {
    final response =
        await http.post(Uri.parse(UPDATE_URL), body: surgery.toJsonUpdate());
    if (response.statusCode == 200) {
      //print("Update Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  Future<String> deleteSurgery(Surgery surgery) async {
    final response =
        await http.post(Uri.parse(DELETE_URL), body: surgery.toJsonUpdate());
    if (response.statusCode == 200) {
     // print("Delete Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }
}