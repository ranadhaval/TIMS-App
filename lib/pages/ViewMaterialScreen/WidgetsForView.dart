import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/util/hex_code.dart';
// import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';
import '../../util/constant.dart';
import '../../util/resources.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../util/strings.dart';
import '../../widgets/bottom_card.dart';
import '../../widgets/timer_bar.dart';
import '../Training_Matrix_Screen/Training_Matrix.dart';

class PdfView extends StatefulWidget {
  const PdfView({super.key});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  late double height;
  late double width;
  String url =
      "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf";
  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(12.0),
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
                  height: 120,
                  width: mediawidth,
                  child: SfPdfViewer.network(
                    'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                    key: _pdfViewerKey,
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: BottomCardWithOneButton(
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
        )
      ]);
    });
  }
}

// Scaffold(
//       appBar: AppBar(
//         title: const Text('Syncfusion Flutter PDF Viewer'),
//       ),
//       body: SfPdfViewer.network(
//         'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
//         key: _pdfViewerKey,
//       ),
//     )



