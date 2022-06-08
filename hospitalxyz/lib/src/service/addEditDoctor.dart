// ignore_for_file: unnecessary_null_comparison, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hospitalxyz/src/models/doctor.dart';
import 'package:email_validator/email_validator.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hospitalxyz/src/service/doctorService.dart';

class AddEditDoctor extends StatefulWidget {
  final Doctor doctor;
  final int index;

  // ignore: use_key_in_widget_constructors
  AddEditDoctor({
     this.doctor,
     this.index,
  });

  @override
  _AddEditDoctorState createState() => _AddEditDoctorState();
}

final _formKey = GlobalKey<FormState>();

class _AddEditDoctorState extends State<AddEditDoctor> {
  final TextEditingController doctorName = TextEditingController();
  final TextEditingController doctorCrm = TextEditingController();
  final TextEditingController doctorCpf = TextEditingController();

  bool _isValid = false;
  bool editMode = false;

  add(Doctor doutor) async {
    await DoctorService().addDoctor(doutor).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Doutor adicionado!")),
      );
      Navigator.pop(context);
    });
    //print("Cidadão Adicionado!");
  }

  update(Doctor doutor) async {
    await DoctorService().updateDoctor(doutor).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Doutor atualizado!")),
      );
      Navigator.pop(context);
    });
    //print("Cidadão Adicionado!");
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      doctorName.text = widget.doctor.doctorName;
      doctorCrm.text = widget.doctor.doctorCrm;
      doctorCpf.text = widget.doctor.doctorCpf;
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
                        controller: doctorName,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          labelText: 'Digite o Nome',
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
                        controller: doctorCrm,
                        decoration: const InputDecoration(
                          labelText: 'Digite o Crm',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfInputFormatter()
                        ],
                        textAlign: TextAlign.center,
                        controller: doctorCpf,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Digite o CPF',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 5),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.trim().length < 3) {
                            return 'Por Favor Digite um CPF';
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String cpf = doctorCpf.text;
                        if (GetUtils.isCpf(cpf)) {
                            if (_formKey.currentState.validate()) {
                              if (editMode) {
                                Doctor doctor = Doctor(
                                  doctorId: widget.doctor.doctorId,
                                  doctorName: doctorName.text,
                                  doctorCrm: doctorCrm.text,
                                  doctorCpf: doctorCpf.text,
                                );
                                update(doctor);
                              } else {
                                Doctor doctor = Doctor(
                                  doctorName: doctorName.text,
                                  doctorCrm: doctorCrm.text,
                                  doctorCpf: doctorCpf.text,
                                );
                                add(doctor);
                              
                            }
                          } else if (doctorCrm.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Favor preencher Email")),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Email Inválido")),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("CPF Inválido")),
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
