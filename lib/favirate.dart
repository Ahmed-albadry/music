// ignore_for_file: unrelated_type_equality_checks, must_be_immutable

import 'package:flutter/material.dart';
import 'data.dart';
import 'design/desinImage.dart';
import 'drawer.dart';

class Favirate extends StatelessWidget {
  static const String id = 'favirate';

  @override
  Widget build(BuildContext context) {
    // if (favi.isEmpty) {
    //   return Scaffold(
    //     appBar: AppBar(),
    //     body: Center(
    //       child: Text('ليس هنالك شي في المفضلة'),
    //     ),
    //   );
    // }
    // {
    return GridView(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 7 / 8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: tamer
            .map(
              (e) => InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Designimage(e)));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        e.img,
                        height: 200,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            )
            .toList());
  }
}

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drower(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('حــول '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Thanks For Ay Person',
            style: TextStyle(
                fontSize: 28,
                color: Colors.indigo,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Supported Me',
            style: TextStyle(
                fontSize: 30,
                color: Colors.indigo,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage(
                'images/sk.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
