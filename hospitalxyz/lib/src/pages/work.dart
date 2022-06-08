// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers
import 'package:hospitalxyz/src/service/addEditDoctor.dart';
import 'package:hospitalxyz/src/service/doctorService.dart';
import 'package:flutter/material.dart';

import '../models/doctor.dart';

class DoctorList extends StatefulWidget {
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
   List<Doctor>doctorList;

  bool loading = true;

  getAllDoctors() async {
   doctorList = await DoctorService().getDoctor();
    setState(() {
      loading = false;
    });
   // print("user : ${clientesList.length}");
  }

  delete(Doctor doctor) async {
    await DoctorService().deleteDoctor(doctor);
    setState(() {
      loading = false;
      getAllDoctors();
    });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Doutor deletado!")),
      );
  }

  @override
  void initState() {
    super.initState();
    getAllDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Médicos'),
        actions: <Widget>[
          IconButton(
            
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditDoctor(),
                ),
              ).then((value) => getAllDoctors());
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
                itemCount: doctorList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, i) {
                  Doctor doctor = doctorList[i];
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddEditDoctor(doctor: doctor, index: i),
                        ),
                      ).then((value) => getAllDoctors());
                    },
                    
                    leading: CircleAvatar(
                      child: Text(doctor.doctorName[0]),
                    ),
                    title: Text(doctor.doctorName),
                    subtitle: Text(doctor.doctorCpf),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Excluir Doutor?'),
                              content: Text('Tem ceteza?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Não'),
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
                              delete(doctor);
                            }
                          });
                        }),
                  );
                }),
        
        ),
      
    );
  }
}
