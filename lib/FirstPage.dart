import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  List l1 = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Video(0);
  }

  void Video(int index) {
    videoPlayerController = VideoPlayerController.network(l1[index]);
    videoPlayerController!.initialize().then((value) => setState(() {}));
    chewieController =
        ChewieController(videoPlayerController: videoPlayerController!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Video Player"),
          centerTitle: true,
        ),
        body: PageView.builder(
            itemCount: l1.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              Video(index);
              return Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: Chewie(
                        controller: chewieController!,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
