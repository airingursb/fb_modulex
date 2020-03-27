import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  AudioPlayer audioPlayer = AudioPlayer();

  bool _isPlaying = false;

  play() async {
    int result =
        await audioPlayer.play('assets/audios/song1.mp3', isLocal: true);
    // int result =
    //     await audioPlayer.play('https://airing.ursb.me/assets/audios/song1.mp3');
  }

  stop() async {
    await audioPlayer.stop();
  }

  resume() async {
    await audioPlayer.resume();
  }

  seek() async {
    await audioPlayer.seek(Duration(milliseconds: 1200));
  }

  void initState() {
    super.initState();

    audioPlayer.onAudioPositionChanged
        .listen((Duration p) => {print('Current position: $p')});

    audioPlayer.onPlayerStateChanged
        .listen((AudioPlayerState s) => {print('Current player state: $s')});

    audioPlayer.onPlayerCompletion.listen((event) {
      // onComplete();
      print('complete');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[

          generateBluredImage(size),

          Container(
              alignment: AlignmentDirectional.topCenter,
              margin: EdgeInsets.only(top: 100),
              width: size.width,
              child: Column(
                children: <Widget>[
                  Image.network(
                    "https://airing.ursb.me/image/qmlog/cover6.png",
                    width: 350,
                    height: 350,
                    fit: BoxFit.fill,
                  ),
                  Container(),
                  Container(),
                  Container(
                    margin: EdgeInsets.only(left: 12.5, right: 12.5, top: 300),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(
                          Icons.loop,
                          color: Colors.white54,
                          size: 40.0,
                        ),
                        Icon(
                          Icons.arrow_left,
                          color: Colors.white,
                          size: 60.0,
                        ),
                        GestureDetector(
                          child: Icon(
                            (_isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled),
                            color: Colors.white,
                            size: 80.0,
                          ),
                          onTap: () {
                            // play();
                            setState(() {
                              _isPlaying = !_isPlaying;
                            });
                          },
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 60.0,
                        ),
                        Icon(
                          Icons.playlist_add,
                          color: Colors.white54,
                          size: 40.0,
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }



  Widget generateBluredImage(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://airing.ursb.me/image/qmlog/cover6.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.55)),
        ),
      ),
    );
  }
}
