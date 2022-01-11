import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data.dart';

class Designimage extends StatelessWidget {
  final Tamer mora;

  Designimage(this.mora);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.pinkAccent,
      body: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            mora.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              FloatingActionButton(
                onPressed: () async {
                  share();
                },
                child: Icon(Icons.share),
                heroTag: 'btn1',
              ),
              SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.star),
                heroTag: 'btn2',
              ),
            ],
          ),
        )
      ],
    );
  }

  share() async {
    // final imges = mora.img;
    //     'https://www.pngitem.com/pimgs/m/0-4203_hat-ball-tree-leaf-candy-christmas-png-image.png';
    // final url = Uri.parse(imges);
    // final reponse = await http.get(url);
    // final byte = reponse.bodyBytes;
    // print(byte);
    // final temp = await getTemporaryDirectory();
    // print(temp);
    // final path = '${temp.path}/image.jpg';
    // print(path);
    // File(path).writeAsBytesSync(byte);
    // await Share.shareFiles([path]);
    // final images = await ImagePicker().pickImage(source: ImageSource.gallery);
    // final pp =await pick();
    //  Share.shareFiles(pp);
  }

//   Future<List<String>> pick() async {
//     final res = await FilePicker.platform.pickFiles(allowMultiple: true);
//  //   return   res.paths;
//   }

  save() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      String path = '${mora.img}';
      final res = await GallerySaver.saveImage(path);
      print(res);
    }
  }
}
