// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers
import 'package:hospitalxyz/src/service/addEditPatient.dart';
import 'package:hospitalxyz/src/service/patientService.dart';
import 'package:flutter/material.dart';

import '../models/patient.dart';

class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
   List<Patient>patientList;

  bool loading = true;

  getAllPatient() async {
   patientList = await PatientService().getPatient();
    setState(() {
      loading = false;
    });
   // print("user : ${clientesList.length}");
  }

  delete(Patient patient) async {
    await PatientService().deletePatient(patient);
    setState(() {
      loading = false;
      getAllPatient();
    });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Paciente deletado!")),
      );
  }

  @override
  void initState() {
    super.initState();
    getAllPatient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Pacientes'),
        actions: <Widget>[
          IconButton(
            
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditPatient(),
                ),
              ).then((value) => getAllPatient());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: patientList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, i) {
                  Patient patient = patientList[i];
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddEditPatient(paciente: patient, index: i),
                        ),
                      ).then((value) => getAllPatient());
                    },
                    
                    leading: CircleAvatar(
                      child: Text(patient.patientName[0]),
                    ),
                    title: Text(patient.patientName),
                    subtitle: Text(patient.patientCpf),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Excluir Paciente?'),
                              content: Text('Tem ceteza?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('N??o'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                ),
                                TextButton(
                                  child: Text('Sim'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                ),
                              ],
                            ),
                          ).then((confirmed) {
                            if (confirmed) {
                              delete(patient);
                            }
                          });
                        }),
                  );
                }),
        
        ),
      
    );
  }
}
