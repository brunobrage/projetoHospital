// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers
import 'package:hospitalxyz/src/models/student.dart';
import 'package:hospitalxyz/src/service/addEditStudent.dart';
import 'package:hospitalxyz/src/service/studentService.dart';
import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
   List<Student>studentList;

  bool loading = true;

  getAllStudents() async {
   studentList = await StudentService().getStudent();
    setState(() {
      loading = false;
    });
   // print("user : ${clientesList.length}");
  }

  delete(Student student) async {
    await StudentService().deleteStudent(student);
    setState(() {
      loading = false;
      getAllStudents();
    });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Aluno deletado!")),
      );
  }

  @override
  void initState() {
    super.initState();
    getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Alunos'),
        actions: <Widget>[
          IconButton(
            
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditStudent(),
                ),
              ).then((value) => getAllStudents());
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
                itemCount: studentList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, i) {
                  Student student = studentList[i];
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddEditStudent(student: student, index: i),
                        ),
                      ).then((value) => getAllStudents());
                    },
                    
                    leading: CircleAvatar(
                      child: Text(student.studentName[0]),
                    ),
                    title: Text(student.studentName),
                    subtitle: Text(student.studentCpf),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Excluir Aluno?'),
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
                              delete(student);
                            }
                          });
                        }),
                  );
                }),
        
        ),
      
    );
  }
}
