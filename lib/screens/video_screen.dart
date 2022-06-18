import 'package:flutter/material.dart';
import 'package:login/models/video_model.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
// import 'package:flutter/services.dart' as bundler;
// import 'dart:convert';

class VideoScreen extends StatefulWidget {
  final VideoModel item;

  const VideoScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController controller;
  ChewieController? chewieController;

  void initPlayer() async {
    print('${widget.item.source}');
    controller = VideoPlayerController.network('${widget.item.source}');
    await controller.initialize();

    chewieController = ChewieController(
        videoPlayerController: controller, autoPlay: true, looping: true);
  }

  @override
  void initState() {
    super.initState();
    // print('${widget.item.source}');
    initPlayer();
  }

  @override
  void dispose() {
    controller.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 71, 149, 180),
                Color.fromARGB(255, 118, 161, 178),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.lightBlue,
            ),
            onPressed: () {
              //passing this to our root
              // Navigator.of(context).pop();
            },
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  const snackBar = SnackBar(content: Text('Tap'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: chewieController != null
                    // ? AspectRatio(
                    //     aspectRatio: controller!.value.aspectRatio,
                    //     child:
                    ? Chewie(
                        controller: chewieController!,
                      )
                    // )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(12.0),
                        child: const Text('I am the video player'),
                        color: Colors.amberAccent,
                      ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12.0),
                color: Color.fromARGB(255, 122, 193, 221),
                // decoration: const BoxDecoration(
                //   border: Border(
                //     bottom: BorderSide(width: 1.0, color: Colors.black),
                //   ),
                // ),
                child: Text(
                  '${widget.item.title}',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: Color.fromARGB(255, 8, 29, 46),
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(1),
                          offset: const Offset(0, 0),
                          blurRadius: 0),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 122, 193, 221),
                      Color.fromARGB(255, 235, 239, 240),
                    ],
                  ),
                ),
                child: Text(
                  '${widget.item.description}',
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 29, 46),
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(1),
                          offset: const Offset(0, 0),
                          blurRadius: 0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
