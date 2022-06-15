import 'package:flutter/material.dart';
import 'package:login/models/video_model.dart';
import 'package:flutter/services.dart' as bundler;
import 'dart:convert';

class VideoListing extends StatefulWidget {
  const VideoListing({Key? key}) : super(key: key);

  @override
  State<VideoListing> createState() => _VideoListingState();
}

class _VideoListingState extends State<VideoListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getJsonData(),
        builder: (context, data) {
          var videos = data.data as List<VideoModel>;
          if (data.hasError) {
            return const Center(
                child: Text('An Error Occurred! Please Try Refreshing.'));
          }
          return ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.1,
                padding: const EdgeInsets.all(12.0),
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {
                    const snackBar =
                        SnackBar(content: Text('Card Tapped For Video'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: ListTile(
                    leading: const Icon(Icons.play_circle),
                    title: Text(videos[index].title.toString()),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<VideoModel>> getJsonData() async {
    final jsonData =
        await bundler.rootBundle.loadString('assets/data/datafile.json');
    final list = jsonDecode(jsonData) as List<dynamic>;
    return list.map((e) => VideoModel.fromJson(e)).toList();
  }
}
