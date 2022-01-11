import 'package:audio/design/designMusic.dart';
import 'package:audio/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'data.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  final zoomDrawer = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drower(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('اغاني تامر حسني',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 75),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                      color: Colors.pink),
                ),
                ListView.builder(
                    itemCount: tamer.length,
                    itemBuilder: (context, x) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DesignMusic(tamer[x])));
                          },
                          child: Cardo(tamer[x]));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Cardo extends StatelessWidget {
  final Tamer mora;
  Cardo(this.mora);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                border: Border.all(color: Colors.amber, width: 3)),
          ),
          Positioned(
            left: 0,
            child: Container(
                height: 110,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/t6.jpg',
                  ),
                )),
          ),
          Positioned(
            bottom: 0,
            right: 20,
            child: SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width - 210,
              child: Column(
                children: [
                  Text(
                    mora.txt,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
