// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:hospitalxyz/constants.dart';
import 'package:hospitalxyz/src/models/news.dart';
import 'package:hospitalxyz/src/widgets/primaryCard.dart';
import 'package:hospitalxyz/src/widgets/secondaryCard.dart';

class NewsTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            padding: EdgeInsets.only(left: 18),
            child: ListView.builder(
              itemCount: popularList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var news = popularList[index];

                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 12),
                    child: PrimaryCard(
                      news: news,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 25),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19),
              child: Text("Baseado na sua leitura", style: kNonActiveTabStyle),
            ),
          ),
          ListView.builder(
              itemCount: recentList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                var recent = recentList[index];
                return InkWell(
                  onTap: (){},
                  child: Container(
                    width: double.infinity,
                    height: 135,
                    margin: EdgeInsets.symmetric(horizontal:18, vertical: 8),
                    child: SecondaryCard(news: recent),
                  )
                );
              })
        ],
      ),
    );
  }
}
