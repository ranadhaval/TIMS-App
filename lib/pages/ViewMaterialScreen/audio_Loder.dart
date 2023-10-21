import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

import '../../theme/app_theme.dart';

import '../../util/constant.dart';
import '../../util/hex_code.dart';
import '../../util/resources.dart';
import '../../util/strings.dart';
import '../../widgets/bottom_card.dart';
import '../../widgets/timer_bar.dart';
import '../Training_Matrix_Screen/Training_Matrix.dart';

class AudioLoder extends StatefulWidget {
  const AudioLoder({super.key});

  @override
  State<AudioLoder> createState() => _AudioLoderState();
}

class _AudioLoderState extends State<AudioLoder> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duaration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minuts = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minuts,
      seconds,
    ].join(':');
  }

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isplaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duaration = event;
      });
    });

    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    setState(() {
      audioPlayer.dispose();
    });

    super.dispose();
  }

  AudioPlayer myAudioPlayer = AudioPlayer();

  bool isplaying = false;
  int value = 0;
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    double mediaHight = MediaQuery.of(context).size.height;
    double mediaWidth = MediaQuery.of(context).size.width;
    return Sizer(builder: (context, orientation, dtype) {
      double mediahight = MediaQuery.of(context).size.height;
      double mediawidth = MediaQuery.of(context).size.width;
      bool isPortrait = orientation == Orientation.portrait;

      bool landscap = orientation == Orientation.landscape;

      if (isPortrait) {
        height = 100.h;
        width = 100.w;
      } else {
        height = 100.w;
        width = 100.h;
      }
      // bool landscap = orientation == Orientation.landscape;
      return Stack(children: [
        SingleChildScrollView(
          child: Container(
            width: mediawidth,
            decoration: BoxDecoration(
              color: AppTheme.AppbarColor,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: landscap
                        ? mediawidth / Constant.ladscapappbarHight
                        : mediahight / Constant.potraitappbarHight,
                    width: mediawidth,
                    child: const Image(
                      image: AssetImage(gradientImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: landscap
                      ? mediawidth - (mediawidth / Constant.ladscapappbarHight)
                      : mediahight - (mediahight / Constant.potraitappbarHight),
                  width: mediawidth,
                  color: HexColor('#d0d3da'),
                ),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TimerBar(),
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('View Material'),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 10,
                color: HexColor('#d0d3da'),
              ),
              Expanded(
                  child: Container(
                color: HexColor('#d0d3da'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Slider(
                        min: 0,
                        max: duaration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) async {
                          final position = Duration(seconds: value.toInt());
                          await audioPlayer.seek(position);
                          await audioPlayer.resume();
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatTime(position)),
                          Text(formatTime(duaration))
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 35,
                      child: IconButton(
                          onPressed: () async {
                            if (isplaying) {
                              await audioPlayer.pause();
                            } else {
                              Source audioUrl = UrlSource(
                                  'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3');

                              await audioPlayer.play(audioUrl);
                            }
                          },
                          icon:
                              Icon(isplaying ? Icons.pause : Icons.play_arrow)),
                    )
                  ],
                ),
              )),
              BottomCardWithOneButton(
                onTap: () {
                  Get.back();
                  Get.offAll(const MatrixScreen());
                  // controller.timeTaken.value =
                  //     1800 - controller.decreasingSecond;
                  // controller.time1.value =
                  //     controller.returnTime(controller.timeTaken.value);
                  // controller.update();
                },
                title: Strings.finish,
                // controller: controller,
                Width: width,
                height: height,
                isTablet: isTablet,
                isBlue: false,
              ),
            ],
          ),
        )
      ]);
    });
  }
}
