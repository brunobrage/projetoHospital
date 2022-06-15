// ignore_for_file: unnecessary_null_comparison, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hospitalxyz/src/models/surgery.dart';
import 'package:hospitalxyz/src/service/surgeryService.dart';

class AddEditSurgery extends StatefulWidget {
  final Surgery surgery;
  final int index;

  // ignore: use_key_in_widget_constructors
  AddEditSurgery({
     this.surgery,
     this.index,
  });

  @override
  _AddEditSurgeryState createState() => _AddEditSurgeryState();
}

final _formKey = GlobalKey<FormState>();

class _AddEditSurgeryState extends State<AddEditSurgery> {
  final TextEditingController surgeryName = TextEditingController();
  final TextEditingController doctorName = TextEditingController();
  final TextEditingController patientName = TextEditingController();

  bool editMode = false;

  add(Surgery surgery) async {
    await SurgeryService().addSurgery(surgery).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cirurgia adicionada!")),
      );
      Navigator.pop(context);
    });
  }

  update(Surgery surgery) async {
    await SurgeryService().updateSurgery(surgery).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cirurgia atualizada!")),
      );
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      surgeryName.text = widget.surgery.surgeryName;
      doctorName.text = widget.surgery.doctorName;
      patientName.text = widget.surgery.patientName;
    }
  }

  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
            centerTitle: true,
            title: Text(editMode ? "Atualizar" : "Cadastrar"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: surgeryName,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          labelText: 'Digite o Nome da cirurgia',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 5),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.trim().length < 3) {
                            return 'Por Favor Digite um Nome';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: doctorName,
                        decoration: const InputDecoration(
                          labelText: 'Digite o nome do Medico',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: patientName,
                        decoration: const InputDecoration(
                          labelText: 'Digite o nome do Paciente',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 5),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                              if (editMode) {
                                Surgery surgery = Surgery(
                                  surgeryId: widget.surgery.surgeryId,
                                  surgeryName: surgeryName.text,
                                  doctorName: doctorName.text,
                                  patientName: patientName.text,
                                );
                                update(surgery);
                              } else {
                                Surgery surgery = Surgery(
                                  surgeryName: surgeryName.text,
                                  doctorName: doctorName.text,
                                  patientName: patientName.text,
                                );
                                add(surgery);
                              
                            
                          } if (surgeryName.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Favor preencher o nome da cirurgia")),
                            );
                          }
                      },
                      child: Text(editMode ? "Atualizar" : "Cadastrar"),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
