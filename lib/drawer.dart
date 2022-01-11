import 'dart:io';
import 'package:audio/image.dart';
import 'package:audio/music.dart';
import 'package:flutter/material.dart';
import 'favirate.dart';

class Drower extends StatelessWidget {
  const Drower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.indigo,
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('images/sk.png'),
                      )),
                  Column(
                    children: [
                      Text('Ghost',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 15),
                      Text('ghostco256@gmail.com',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              draw(Icons.music_note, 'الاغــــاني', () => index(context, 0)),
              draw(Icons.photo, 'الصـــــور', () => index(context, 1)),
              draw(Icons.favorite, 'المفضــلة', () => index(context, 2)),
              draw(Icons.info_outline, 'حــــــول', () => index(context, 3)),
              SizedBox(
                height: 50,
              ),
              draw(Icons.exit_to_app, 'خـــــروج', () => index(context, 4)),
            ],
          )
        ]),
      ),
    );
  }

  draw(IconData icon, String txt, VoidCallback tap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white54)),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            child: Builder(builder: (context) {
              return ListTileTheme(
                selectedTileColor: Colors.white,
                child: ListTile(
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 25,
                  ),
                  selectedTileColor: Colors.pink,
                  leading: Icon(
                    (icon),
                    color: Colors.white,
                    size: 25,
                  ),
                  title:
                      Text(txt, style: Theme.of(context).textTheme.headline5),
                  onTap: tap,
                  hoverColor: Colors.pink,
                ),
              );
            })),
      ),
    );
  }

  index(BuildContext context, int x) {
    switch (x) {
      case 0:
        return Navigator.push(
            context, MaterialPageRoute(builder: (_) => Music()));
      case 1:
        return Navigator.push(
            context, MaterialPageRoute(builder: (_) => Images()));
      case 2:
        return Navigator.push(
            context, MaterialPageRoute(builder: (_) => Favirate()));
      case 3:
        return Navigator.push(
            context, MaterialPageRoute(builder: (_) => About()));
      case 4:
        return exit(0);
    }
  }
}
