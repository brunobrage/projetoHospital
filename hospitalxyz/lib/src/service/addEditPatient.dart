// ignore_for_file: unnecessary_null_comparison, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hospitalxyz/src/models/patient.dart';
import 'package:email_validator/email_validator.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hospitalxyz/src/service/patientService.dart';

class AddEditPatient extends StatefulWidget {
  final Patient paciente;
  final int index;

  // ignore: use_key_in_widget_constructors
  AddEditPatient({
     this.paciente,
     this.index,
  });

  @override
  _AddEditPatientState createState() => _AddEditPatientState();
}

final _formKey = GlobalKey<FormState>();

class _AddEditPatientState extends State<AddEditPatient> {
  final TextEditingController patientName = TextEditingController();
  final TextEditingController patientEmail = TextEditingController();
  final TextEditingController patientCpf = TextEditingController();

  bool _isValid = false;
  bool editMode = false;

  add(Patient alunos) async {
    await PatientService().addPatient(alunos).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Aluno adicionado!")),
      );
      Navigator.pop(context);
    });
    //print("Cidadão Adicionado!");
  }

  update(Patient alunos) async {
    await PatientService().updatePatient(alunos).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Aluno atualizado!")),
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
      patientName.text = widget.paciente.patientName;
      patientEmail.text = widget.paciente.patientEmail;
      patientCpf.text = widget.paciente.patientCpf;
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
                        controller: patientName,
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
                        controller: patientEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Digite o Email',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 5),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.trim().length < 3) {
                            return 'Por Favor Digite um Email';
                          }
                          return null;
                        },
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
                        controller: patientCpf,
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
                        String cpf = patientCpf.text;
                        if (GetUtils.isCpf(cpf)) {
                          _isValid = EmailValidator.validate(patientEmail.text);
                          if (_isValid) {
                            if (_formKey.currentState.validate()) {
                              if (editMode) {
                                Patient patient = Patient(
                                  patientId: widget.paciente.patientId,
                                  patientName: patientName.text,
                                  patientEmail: patientEmail.text,
                                  patientCpf: patientCpf.text,
                                );
                                update(patient);
                              } else {
                                Patient patient = Patient(
                                  patientName: patientName.text,
                                  patientEmail: patientEmail.text,
                                  patientCpf: patientCpf.text,
                                );
                                add(patient);
                              }
                            }
                          } else if (patientEmail.text.isEmpty) {
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
