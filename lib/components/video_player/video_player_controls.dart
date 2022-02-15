import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:state_management/components/video_player/challange_label.dart';
import 'package:state_management/components/video_player/video_control_bar.dart';
import 'package:state_management/components/video_player/rounded_button.dart';

import '../../helper.dart';

/// Default portrait controls.
class VideoPlayerControls extends StatelessWidget {
  const VideoPlayerControls(
      {Key? key,
      this.iconSize = 20,
      this.fontSize = 12,
      this.progressBarSettings})
      : super(key: key);

  /// Icon size.
  ///
  /// This size is used for all the player icons.
  final double iconSize;

  /// Font size.
  ///
  /// This size is used for all the text.
  final double fontSize;

  /// [FlickProgressBarSettings] settings.
  final FlickProgressBarSettings? progressBarSettings;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: FlickVideoBuffer(
                  child: FlickAutoHideChild(
                    showIfVideoNotInitialized: false,
                    child: FlickPlayToggle(
                      size: 30,
                      color: Colors.black,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        FlickAutoHideChild(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                VideoControlBar(
                  flickProgressBarSettings: progressBarSettings,
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Unna',
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      ChallengeLabel(
                        challange: Voice(),
                      ),
                    ],
                  ),
                ),
                RoundedButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
