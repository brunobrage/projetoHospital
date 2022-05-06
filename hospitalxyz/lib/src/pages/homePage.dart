// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hospitalxyz/constants.dart';
import 'package:hospitalxyz/src/views/Heroes.dart';
import 'package:hospitalxyz/src/views/world.dart';
import 'package:hospitalxyz/src/views/newsTabView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Bem Vindo!",
                  textAlign: TextAlign.end,
                  style: kNonActiveTabStyle,
                ),
                subtitle: Text(
                  "Bruno Marques",
                  textAlign: TextAlign.end,
                  style: kActiveTabStyle,
                ),
                trailing: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("lib/assets/download.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  unselectedLabelColor: kGrey1,
                  unselectedLabelStyle: kNonActiveTabStyle,
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  labelStyle: kActiveTabStyle.copyWith(fontSize: 25),
                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: [
                    Tab(text: "Novidades"),
                    Tab(text: "Nossos Herois"),
                    Tab(text: "Noticias"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          NewsTabView(),
          Herois(),
          Noticias(),
        ],),
      ),
    );
  }
}
