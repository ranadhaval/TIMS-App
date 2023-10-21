import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tims/pages/ViewMaterialScreen/WidgetsForView.dart';
import 'package:tims/pages/ViewMaterialScreen/viewMaterialpage2.dart';
import 'package:tims/util/resources.dart';
import '../../util/hex_code.dart';
import 'Html_loder.dart';
import 'audio_Loder.dart';

ExpansionTile1(context, String title, int index) {
  double mediaHight = MediaQuery.of(context).size.height;
  double mediaWidth = MediaQuery.of(context).size.width;
  final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
  return Container(
    width: mediaWidth - 20,
    child: ListTileTheme(
      shape:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      tileColor: Colors.white,
      child: Theme(
        data: theme,
        child: ExpansionTile(
          backgroundColor: Colors.transparent,
          title: Container(
            width: mediaWidth - 10,
            child: Row(
              children: [
                CircleAvatar(
                  child: Text("$index"),
                  radius: 14,
                  backgroundColor: HexColor("#fb46a7"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: HexColor("#fb46a7"),
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          children: [
            bodyOfExpansionTile(context, htmlIcon, () {
              Get.to(
                HtmlLoder(),
                arguments: ['html'],
              );
            }, "google.com"),
            bodyOfExpansionTile(context, pdfIcon, () {
              Get.to(PdfView());
            }, "1A00AB001_3.pdf"),
            bodyOfExpansionTile(context, audioIcon, () {
              Get.to(AudioLoder());
            }, "new.MP3"),
            bodyOfExpansionTile(context, videoIcon, () {
              Get.to(MaterialPage2());
            }, "1A00A478_3.MP4"),
          ],
        ),
      ),
    ),
  );
}

bodyOfExpansionTile(context, String icon, ontap, String name) {
  double mediaWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      color: Color.fromRGBO(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: HexColor("#2ddb97"),
                  child: Container(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        '$icon',
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                for (int i = 0; i < 8; i++) Line()
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: ontap,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: mediaWidth - 10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: HexColor("#eafef3"),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        height: 60,
                        width: mediaWidth - 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Min.Read Time:  00:00:00",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Read: ",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 15,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                "Read Time:  00:00:00",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget Line() {
  return Padding(
    padding: const EdgeInsets.all(0.7),
    child: Container(
      height: 2,
      width: 2,
      color: HexColor("#2ddb97"),
    ),
  );
}
