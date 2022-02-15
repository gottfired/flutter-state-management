import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:state_management/components/video_player/video_player.dart';

class VideoPlayerPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoPlayer(),
    );
  }
}
