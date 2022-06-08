// ignore_for_file: unnecessary_null_comparison, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hospitalxyz/src/models/student.dart';
import 'package:email_validator/email_validator.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hospitalxyz/src/service/studentService.dart';

class AddEditStudent extends StatefulWidget {
  final Student student;
  final int index;

  // ignore: use_key_in_widget_constructors
  AddEditStudent({
     this.student,
     this.index,
  });

  @override
  _AddEditStudentState createState() => _AddEditStudentState();
}

final _formKey = GlobalKey<FormState>();

class _AddEditStudentState extends State<AddEditStudent> {
  final TextEditingController studentName = TextEditingController();
  final TextEditingController studentEmail = TextEditingController();
  final TextEditingController studentCpf = TextEditingController();

  bool _isValid = false;
  bool editMode = false;

  add(Student alunos) async {
    await StudentService().addStudent(alunos).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Aluno adicionado!")),
      );
      Navigator.pop(context);
    });
    //print("Cidadão Adicionado!");
  }

  update(Student alunos) async {
    await StudentService().updateStudent(alunos).then((success) {
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
      studentName.text = widget.student.studentName;
      studentEmail.text = widget.student.studentEmail;
      studentCpf.text = widget.student.studentCpf;
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
                        controller: studentName,
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
                        controller: studentEmail,
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
                        controller: studentCpf,
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
                        String cpf = studentCpf.text;
                        if (GetUtils.isCpf(cpf)) {
                          _isValid = EmailValidator.validate(studentEmail.text);
                          if (_isValid) {
                            if (_formKey.currentState.validate()) {
                              if (editMode) {
                                Student student = Student(
                                  studentId: widget.student.studentId,
                                  studentName: studentName.text,
                                  studentEmail: studentEmail.text,
                                  studentCpf: studentCpf.text,
                                );
                                update(student);
                              } else {
                                Student student = Student(
                                  studentName: studentName.text,
                                  studentEmail: studentEmail.text,
                                  studentCpf: studentCpf.text,
                                );
                                add(student);
                              }
                            }
                          } else if (studentEmail.text.isEmpty) {
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
