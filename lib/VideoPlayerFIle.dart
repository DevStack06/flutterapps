import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerFileCustum extends StatefulWidget {
  VideoPlayerFileCustum({Key key, this.videopath}) : super(key: key);
  final String videopath;

  @override
  _VideoPlayerFileState createState() => _VideoPlayerFileState();
}

class _VideoPlayerFileState extends State<VideoPlayerFileCustum> {
  VideoPlayerController _controller;
  Future<void> _video;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videopath));
    _video = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _video,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.value.isPlaying) {
            setState(() {
              _controller.pause();
            });
          } else {
            setState(() {
              _controller.play();
            });
          }
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
