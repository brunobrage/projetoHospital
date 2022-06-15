// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers
import 'package:hospitalxyz/src/service/addEditSurgery.dart';
import 'package:hospitalxyz/src/service/surgeryService.dart';
import 'package:flutter/material.dart';

import '../models/surgery.dart';

class SurgeryList extends StatefulWidget {
  @override
  _SurgeryListState createState() => _SurgeryListState();
}

class _SurgeryListState extends State<SurgeryList> {
   List<Surgery>surgeryList;

  bool loading = true;

  getAllSurgery() async {
   surgeryList = await SurgeryService().getSurgery();
    setState(() {
      loading = false;
    });
   // print("user : ${clientesList.length}");
  }

  delete(Surgery surgery) async {
    await SurgeryService().deleteSurgery(surgery);
    setState(() {
      loading = false;
      getAllSurgery();
    });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Cirurgia deletada!")),
      );
  }

  @override
  void initState() {
    super.initState();
    getAllSurgery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Cirurgias'),
        actions: <Widget>[
          IconButton(
            
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditSurgery(),
                ),
              ).then((value) => getAllSurgery());
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
                itemCount: surgeryList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, i) {
                  Surgery surgery = surgeryList[i];
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddEditSurgery(surgery: surgery, index: i),
                        ),
                      ).then((value) => getAllSurgery());
                    },
                    
                    leading: CircleAvatar(
                      child: Text(surgery.surgeryName[0]),
                    ),
                    title: Text(surgery.surgeryName),
                    subtitle: Text(surgery.patientName),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Excluir Cirurgia?'),
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
                              delete(surgery);
                            }
                          });
                        }),
                  );
                }),
        
        ),
      
    );
  }
}
