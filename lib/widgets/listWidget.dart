import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tims/routes/app_routes.dart';
import 'package:tims/util/constant.dart';
import '../util/hex_code.dart';
import '../util/resources.dart';

List listColor = [
  HexColor("#3f83e6"),
  HexColor("#efab64"),
  HexColor("#a695fc"),
  HexColor("#ff6292"),
  HexColor("#11a680"),
];
List DarkColor = [
  HexColor("#3264bd"),
  HexColor("#bc8a55"),
  HexColor("#8578c9"),
  HexColor("#c94d71"),
  HexColor("#158767"),
];
List OpColor = [
  HexColor("#eef2fe"),
  HexColor("#fff6ef"),
  HexColor("#ffedf3"),
  HexColor("#f5f2ff"),
  HexColor("#e5f8f6"),
];

Widget trainingMatrixList(
    {required BuildContext context,
    required int index,
    required String title,
    required String trainignumber}) {
  double mediaWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.TRAININGDETAIL);
      },
      child: Card(
        elevation: 5,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.transparent)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 4,
                        color: listColor[index % listColor.length],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ListTile(
                      trailing: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: HexColor("#50b3c0"),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Text(
                              " V. 4. 0 ",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ]),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(title,
                            style: const TextStyle(
                                fontSize: 11,
                                color: Colors.black26,
                                fontWeight: FontWeight.bold)),
                      ),
                      title: Text(trainignumber,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      leading: CircleAvatar(
                        backgroundColor: listColor[index % listColor.length],
                        radius: 30,
                        child: const Center(
                          child: Text(
                            "S",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: OpColor[index % OpColor.length],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            Constant.Training,
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            height: 10,
                            width: 10,
                            child: Image(
                              image: AssetImage(
                                in_progress,
                              ),
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            Constant.Evaluation,
                            style: TextStyle(fontSize: 10),
                          ),
                          Icon(
                            Icons.close_sharp,
                            color: Colors.red,
                            size: 13,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                              color: DarkColor[index % DarkColor.length],
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              child: const Center(
                                child: Image(
                                  image: AssetImage(
                                    trainig,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.VIEWMATERIAL);
                            },
                            child: Container(
                              height: 30,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                color: listColor[index % listColor.length],
                              ),
                              child: const Center(
                                  child: Text(
                                Constant.contraTra,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    letterSpacing: 1),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                              color: DarkColor[index % DarkColor.length],
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: const Center(
                                child: Image(
                                  image: AssetImage(
                                    evaluation,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.EVALUATION);
                            },
                            child: Container(
                              height: 30,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                color: listColor[index % listColor.length],
                              ),
                              child: const Center(
                                  child: Text(
                                Constant.Eval,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    letterSpacing: 1),
                              )),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    ),
  );
}
