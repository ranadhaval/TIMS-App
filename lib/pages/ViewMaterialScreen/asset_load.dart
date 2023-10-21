
// for pdf

// import 'package:flutter/material.dart';
// // import 'package:webview_flutter_plus/webview_flutter_plus.dart';
// import '../../theme/app_theme.dart';
// import '../../util/resources.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// class MaterialPage2 extends StatefulWidget {
//   const MaterialPage2({super.key});

//   @override
//   State<MaterialPage2> createState() => _MaterialPage2State();
// }

// class _MaterialPage2State extends State<MaterialPage2> {
//   final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//   }

//   String url =
//       "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf";
//   @override
//   Widget build(BuildContext context) {


//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Syncfusion Flutter PDF Viewer'),
//       ),
//       body: SfPdfViewer.network(
//         'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
//         key: _pdfViewerKey,
//       ),
//     );
//   }
// }



// for html,htm

// import 'package:flutter/material.dart';

// import 'package:webview_flutter/webview_flutter.dart';

// import '../../theme/app_theme.dart';

// import '../../util/resources.dart';

// class MaterialPage2 extends StatefulWidget {
//   const MaterialPage2({super.key});

//   @override
//   State<MaterialPage2> createState() => _MaterialPage2State();
// }

// class _MaterialPage2State extends State<MaterialPage2> {
//   late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..loadRequest(
//         Uri.parse(
//             'https://pub.dev/packages/syncfusion_flutter_pdfviewer/example'),
//       );
//   }





//   @override
//   Widget build(BuildContext context) {
//     double mediaHight = MediaQuery.of(context).size.height;
//     double mediaWidth = MediaQuery.of(context).size.width;
//     return Stack(
//       children: [
//         Container(
//           width: mediaWidth,
//           decoration: BoxDecoration(
//             color: AppTheme.AppbarColor,
//           ),
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: SizedBox(
//                   height: mediaHight / 5.5,
//                   width: mediaWidth,
//                   child: Image(
//                     image: AssetImage(gradientImage),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Expanded(
//                   child: WebViewWidget(
//                 controller: controller,
//               ))
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }



// for audio

// import 'package:flutter/material.dart';

// import 'package:audioplayers/audioplayers.dart';
// import '../../theme/app_theme.dart';

// import '../../util/resources.dart';

// class MaterialPage2 extends StatefulWidget {
//   const MaterialPage2({super.key});

//   @override
//   State<MaterialPage2> createState() => _MaterialPage2State();
// }

// class _MaterialPage2State extends State<MaterialPage2> {
//   AudioPlayer audioPlayer = AudioPlayer();
//   Duration duaration = Duration.zero;
//   Duration position = Duration.zero;

//   String formatTime(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final hours = twoDigits(duration.inHours);
//     final minuts = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));

//     return [
//       if (duration.inHours > 0) hours,
//       minuts,
//       seconds,
//     ].join(':');
//   }

//   @override
//   void initState() {
//     audioPlayer.onPlayerStateChanged.listen((event) {
//       setState(() {
//         isplaying = event == PlayerState.playing;
//       });
//     });

//     audioPlayer.onDurationChanged.listen((event) {
//       setState(() {
//         duaration = event;
//       });
//     });

//     audioPlayer.onPositionChanged.listen((event) {
//       setState(() {
//         position = event;
//       });
//     });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     setState(() {
//       audioPlayer.dispose();
//     });

//     super.dispose();
//   }

//   AudioPlayer myAudioPlayer = AudioPlayer();

//   bool isplaying = false;
//   int value = 0;
//   @override
//   Widget build(BuildContext context) {
//     double mediaHight = MediaQuery.of(context).size.height;
//     double mediaWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: mediaWidth,
//             decoration: BoxDecoration(
//               color: AppTheme.AppbarColor,
//             ),
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: SizedBox(
//                     height: mediaHight / 5.2,
//                     width: mediaWidth,
//                     child: Image(
//                       image: AssetImage(gradientImage),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                     child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Slider(
//                           min: 0,
//                           max: duaration.inSeconds.toDouble(),
//                           value: position.inSeconds.toDouble(),
//                           onChanged: (value) async {
//                             final position = Duration(seconds: value.toInt());
//                             await audioPlayer.seek(position);
//                             await audioPlayer.resume();
//                           }),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(formatTime(position)),
//                             Text(formatTime(duaration))
//                           ],
//                         ),
//                       ),
//                       CircleAvatar(
//                         radius: 35,
//                         child: IconButton(
//                             onPressed: () async {
//                               if (isplaying) {
//                                 await audioPlayer.pause();
//                               } else {
//                                 Source audioUrl = UrlSource(
//                                     'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3');

//                                 await audioPlayer.play(audioUrl);
//                               }
//                             },
//                             icon: Icon(
//                                 isplaying ? Icons.pause : Icons.play_arrow)),
//                       )
//                     ],
//                   ),
//                 ))
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
