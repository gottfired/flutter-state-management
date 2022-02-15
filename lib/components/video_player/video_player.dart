import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:state_management/components/video_player/video_player_controls.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-man-holding-neon-light-1238-large.mp4'),
  );

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
        flickManager: flickManager,
        flickVideoWithControls: FlickVideoWithControls(
          controls: VideoPlayerControls(),
        ),
      ),
    );
  }
}
