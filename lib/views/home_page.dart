// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: <Widget>[
                _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  icon: Icon(_controller.value.isPlaying
                      ? Icons.stop_rounded
                      : Icons.play_arrow_rounded),
                  iconSize: 70,
                  color: Color(0xFF243B67),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    'DISTO es un sistema computacional cuya funcionalidad principal es ayudar a individuos que padecen disfemia tónica. Dicha ayuda consiste en proporcionar un procedimiento que mediante uso de software y hardware permita disminuir a través de la sugerencia de la palabra el tiempo de interrupción o bloqueo generado en una persona con este trastorno del habla (disfemia tónica).',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
