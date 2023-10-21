import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/widgets/simple_button.dart';
import 'package:video_player/video_player.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';

import '../../util/constant.dart';
import '../../util/hex_code.dart';
import '../../util/resources.dart';
import '../../util/strings.dart';
import '../../widgets/bottom_card.dart';
import '../../widgets/timer_bar.dart';
import '../Training_Matrix_Screen/Training_Matrix.dart';

class MaterialPage2 extends StatefulWidget {
  const MaterialPage2({super.key});

  @override
  State<MaterialPage2> createState() => _MaterialPage2State();
}

class _MaterialPage2State extends State<MaterialPage2> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _initializeVideoPlayerFuture = _controller!.initialize();
    _controller!.setLooping(true);
    _controller!.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, dtype) {
      double mediahight = MediaQuery.of(context).size.height;
      double mediawidth = MediaQuery.of(context).size.width;
      bool landscap = orientation == Orientation.landscape;

      bool isPortrait = orientation == Orientation.portrait;

      if (isPortrait) {
        height = 100.h;
        width = 100.w;
      } else {
        height = 100.w;
        width = 100.h;
      }
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
                  color: AppTheme.colorWhite,
                )
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
          body: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  child: isPortrait
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: AspectRatio(
                                aspectRatio: _controller!.value.aspectRatio,
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (_controller!.value.isPlaying) {
                                          _controller!.pause();
                                        } else {
                                          _controller!.play();
                                        }
                                      });
                                    },
                                    child: VideoPlayer(_controller!)),
                              ),
                            ),
                            SimpleButton(
                                bgColors: AppTheme.AppbarColor,
                                borderColors: Colors.transparent,
                                child: Icon(
                                  _controller!.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: AppTheme.colorWhite,
                                ),
                                onTap: () {
                                  setState(() {
                                    if (_controller!.value.isPlaying) {
                                      _controller!.pause();
                                    } else {
                                      _controller!.play();
                                    }
                                  });
                                })
                          ],
                        )
                      : SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  height: 220,
                                  width: mediawidth / 1.5,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (_controller!.value.isPlaying) {
                                            _controller!.pause();
                                          } else {
                                            _controller!.play();
                                          }
                                        });
                                      },
                                      child: VideoPlayer(_controller!)),
                                ),
                              ),
                            ],
                          ),
                        ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          bottomSheet: BottomCardWithOneButton(
            onTap: () {
              Get.back();
              Get.offAll(const MatrixScreen());
            },
            title: Strings.finish,
            Width: width,
            height: height,
            isTablet: isTablet,
            isBlue: false,
          ),
        ),
      ]);
    });
  }
}




// Center(
//                               child: Container(
//                                 height: 250,
//                                 width: mediawidth - 20,
//                                 child: InkWell(
//                                     onTap: () {
//                                       setState(() {
//                                         if (_controller!.value.isPlaying) {
//                                           _controller!.pause();
//                                         } else {
//                                           _controller!.play();
//                                         }
//                                       });
//                                     },
//                                     child: VideoPlayer(_controller!)),
//                               ),
//                             )



    // floatingActionButton: FloatingActionButton(
    //         onPressed: () {},
    //         child: Icon(
    //             _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow),
    //       ),
    //       floatingActionButtonLocation:
    //           FloatingActionButtonLocation.centerDocked,










  // FutureBuilder(
  //       future: _initializeVideoPlayerFuture,
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           return Center(
  //             child: AspectRatio(
  //               aspectRatio: _controller!.value.aspectRatio,
  //               child: VideoPlayer(_controller!),
  //             ),
  //           );
  //         } else {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //       },
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         setState(() {
  //           if (_controller!.value.isPlaying) {
  //             _controller!.pause();
  //           } else {
  //             _controller!.play();
  //           }
  //         });
  //       },
  //       child:
  //           Icon(_controller!.value.isPlaying ? Icons.pause : Icons.play_arrow),
  //     ),
    
    
