import 'package:flutter/material.dart';
import 'package:login/models/video_model.dart';
import 'package:flutter/services.dart' as bundler;
import 'dart:convert';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
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
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
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
                  'Title',
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
                  'Description: ',
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
