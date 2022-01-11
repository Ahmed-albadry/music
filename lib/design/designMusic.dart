import 'package:audio/music.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../data.dart';

class DesignMusic extends StatefulWidget {
  final Tamer mora;
  DesignMusic(this.mora);

  @override
  _DesignMusicState createState() => _DesignMusicState();
}

class _DesignMusicState extends State<DesignMusic> {
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState playerState = PlayerState.PAUSED;
  Duration duration = Duration();
  Duration position = Duration();

  bool repeat = false;

  initState() {
    audioPlayer.onDurationChanged.listen((D) {
      setState(() {
        duration = D;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((P) {
      setState(() {
        position = P;
      });
    });
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((S) {
      setState(() {
        playerState = S;
      });
    });
    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        position = Duration(seconds: 0);
        repeat = false;
      });
    });

    super.initState();
  }

  dispose() {
    audioPlayer.dispose();
    audioPlayer.release();
    audioCache.clearAll();

    super.dispose();
  }

  play() async {
    await audioCache.play(widget.mora.mus);
  }

  puase() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.mora.txt.toString()),
          leading: IconButton(
              onPressed: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Music()));
                await Future.delayed(Duration(seconds: 1));
                audioPlayer.stop();
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Stack(children: [
          Positioned.fill(
              child: Image.asset(
            'images/tt3.jpg',
            fit: BoxFit.cover,
          )),
          Positioned(
            top: size.height / 1.8,
            child: Container(
              height: size.height / 6,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        position.toString().split('.')[0],
                        style: TextStyle(color: Colors.white),
                      ),
                      Slider(
                          activeColor: Colors.red,
                          inactiveColor: Colors.white,
                          min: 0.0,
                          max: duration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              audioPlayer
                                  .seek(Duration(seconds: value.toInt()));
                            });
                          }),
                      Text(duration.toString().split('.')[0],
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () async {
                            if (repeat == false) {
                              await audioPlayer
                                  .setReleaseMode(ReleaseMode.LOOP);
                              setState(() {
                                repeat = true;
                              });
                            } else if (repeat == true) {
                              audioPlayer.setReleaseMode(ReleaseMode.RELEASE);
                              setState(() {
                                repeat = false;
                              });
                            }
                          },
                          icon: repeat
                              ? Icon(
                                  Icons.forward_10_rounded,
                                  size: 40,
                                  color: Colors.amber,
                                )
                              : Icon(
                                  Icons.forward_10_rounded,
                                  size: 40,
                                  color: Colors.white,
                                )),
                      IconButton(
                          onPressed: () async {
                            playerState == PlayerState.PLAYING
                                ? puase()
                                : play();
                          },
                          icon: playerState == PlayerState.PLAYING
                              ? Icon(
                                  Icons.pause_circle_filled,
                                  size: 50,
                                  color: Colors.amber,
                                )
                              : Icon(
                                  Icons.play_circle_fill,
                                  size: 50,
                                  color: Colors.white,
                                )),
                      IconButton(
                          onPressed: () async {
                            await audioPlayer.setPlaybackRate(1.5);
                          },
                          icon: Icon(
                            Icons.double_arrow_rounded,
                            size: 40,
                            color: Colors.white,
                          )),
                    ],
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
