import 'package:audio/data.dart';
import 'package:audio/design/desinImage.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class Images extends StatelessWidget {
  static const String id = 'Images';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drower(),
      appBar: AppBar(
          centerTitle: true,
          title: Text('صور تامر حسني',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
      body: GridView(
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Designimage(e)));
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
            .toList(),
      ),
    );
  }
}
