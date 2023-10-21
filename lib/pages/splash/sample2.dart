// // // sample file

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import 'package:tims/Controller/MatrixPgeController.dart';
// import 'package:tims/model/MatrixScreenPageModel.dart';
// import 'package:tims/webservices/api_request.dart';
// import 'package:tims/widgets/simple_button.dart';
// import '../../theme/app_theme.dart';
// import '../../util/constant.dart';
// import '../../util/strings.dart';
// import 'package:dotted_line/dotted_line.dart';

// const String _TITLE = 'DottedLine Demo';

// class sample extends StatefulWidget {
//   const sample({super.key});

//   @override
//   State<sample> createState() => _sampleState();
// }

// class _sampleState extends State<sample> {
//   // @override
//   // void initState() {
//   //   checkinternet();
//   //   // TODO: implement initState
//   //   super.initState();
//   // }

//   // final Respon = Response();
//   // final appreq = ApiRequest(
//   //     data: {},
//   //     url: "http://202.8.125.236:8081/timsWeb/rest/v1/checkApkLatestVesion");

//   // checkinternet() async {
//   //   final connectivityResult = await (Connectivity().checkConnectivity());
//   //   if (connectivityResult == ConnectivityResult.mobile ||
//   //       connectivityResult == ConnectivityResult.wifi) {
//   //     appreq.postRequest();

//   //     print("hhjj");
//   //   } else {
//   //     print("not valid connection");
//   //   }
//   // }

//   // final key = GlobalKey<FormState>();
//   // TabController? tabcontroller;

//   // @override
//   // initState() {
//   //   tabcontroller = TabController(length: 3, vsync: this);
//   //   // adddata();
//   //   super.initState();
//   // }

//   // final controller = Get.put(MatrixPgeController());

//   // List<Data> hi = [];
//   // List<TrainingList> trainingList = [];

//   // void adddata() {
//   //   for (int i = 0;
//   //       i < controller.matrixList[0].data.trainingList.length;
//   //       i++) {
//   //     hi.add(Data(
//   //         totalNoOftrainings: controller.matrixList[0].data.totalNoOftrainings,
//   //         totalTrainings: controller.matrixList[0].data.totalTrainings,
//   //         completedTrainings: controller.matrixList[0].data.completedTrainings,
//   //         pendingTrainings: controller.matrixList[0].data.pendingTrainings,
//   //         trainingList: controller.matrixList[0].data.trainingList));
//   //   }
//   //   trainingList.addAll(hi[0].trainingList);
//   //   print(trainingList.length);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final space = SizedBox(height: 50);
//     return Scaffold(
//       appBar: AppBar(title: Text(_TITLE)),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             space,
//             Text("Default"),
//             DottedLine(),
//             space,
//             Text("Dash length changed"),
//             DottedLine(dashLength: 40),
//             space,
//             Text("Dash gap length changed"),
//             DottedLine(dashLength: 30, dashGapLength: 30),
//             space,
//             Text("Line thickness changed"),
//             DottedLine(
//               dashLength: 30,
//               dashGapLength: 30,
//               lineThickness: 30,
//             ),
//             space,
//             Text("Dash radius changed"),
//             DottedLine(
//               dashLength: 30,
//               dashGapLength: 30,
//               lineThickness: 30,
//               dashRadius: 16,
//             ),
//             space,
//             Text("Dash and dash gap color changed"),
//             DottedLine(
//               dashLength: 30,
//               dashGapLength: 30,
//               lineThickness: 30,
//               dashColor: Colors.blue,
//               dashGapColor: Colors.red,
//               direction: Axis.vertical,
//             ),
//             space,
//             Text("Line direction and line length changed"),
//             DottedLine(
//               dashLength: 30,
//               dashGapLength: 70,
//               lineThickness: 2,
//               dashColor: Colors.blue,
//               dashGapColor: Colors.red,
//               direction: Axis.vertical,
//               lineLength: 150,
//             ),
//             space,
//             Text("Dash gradient changed"),
//             DottedLine(
//               dashGradient: [
//                 Colors.red,
//                 Colors.blue,
//               ],
//               dashLength: 10,
//               lineThickness: 30,
//             ),
//             space,
//             Text("Dash gradient and dash gap gradient changed"),
//             DottedLine(
//               dashGradient: [
//                 Colors.red,
//                 Colors.red.withAlpha(0),
//               ],
//               dashGapGradient: [
//                 Colors.blue,
//                 Colors.blue.withAlpha(0),
//               ],
//               dashLength: 10,
//               dashGapLength: 10,
//               lineThickness: 30,
//             ),
//             space,
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:dotted_line/dotted_line.dart';
// // import 'package:flutter/material.dart';

// // const String _TITLE = 'DottedLine Demo';

// // class _MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<_MyHomePage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final space = SizedBox(height: 50);
// //     return Scaffold(
// //       appBar: AppBar(title: Text(_TITLE)),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: <Widget>[
// //             space,
// //             Text("Default"),
// //             DottedLine(),
// //             space,
// //             Text("Dash length changed"),
// //             DottedLine(dashLength: 40),
// //             space,
// //             Text("Dash gap length changed"),
// //             DottedLine(dashLength: 30, dashGapLength: 30),
// //             space,
// //             Text("Line thickness changed"),
// //             DottedLine(
// //               dashLength: 30,
// //               dashGapLength: 30,
// //               lineThickness: 30,
// //             ),
// //             space,
// //             Text("Dash radius changed"),
// //             DottedLine(
// //               dashLength: 30,
// //               dashGapLength: 30,
// //               lineThickness: 30,
// //               dashRadius: 16,
// //             ),
// //             space,
// //             Text("Dash and dash gap color changed"),
// //             DottedLine(
// //               dashLength: 30,
// //               dashGapLength: 30,
// //               lineThickness: 30,
// //               dashColor: Colors.blue,
// //               dashGapColor: Colors.red,
// //             ),
// //             space,
// //             Text("Line direction and line length changed"),
// //             DottedLine(
// //               dashLength: 30,
// //               dashGapLength: 30,
// //               lineThickness: 30,
// //               dashColor: Colors.blue,
// //               dashGapColor: Colors.red,
// //               direction: Axis.vertical,
// //               lineLength: 150,
// //             ),
// //             space,
// //             Text("Dash gradient changed"),
// //             DottedLine(
// //               dashGradient: [
// //                 Colors.red,
// //                 Colors.blue,
// //               ],
// //               dashLength: 10,
// //               lineThickness: 30,
// //             ),
// //             space,
// //             Text("Dash gradient and dash gap gradient changed"),
// //             DottedLine(
// //               dashGradient: [
// //                 Colors.red,
// //                 Colors.red.withAlpha(0),
// //               ],
// //               dashGapGradient: [
// //                 Colors.blue,
// //                 Colors.blue.withAlpha(0),
// //               ],
// //               dashLength: 10,
// //               dashGapLength: 10,
// //               lineThickness: 30,
// //             ),
// //             space,
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:tims/pages/splash/sample2.dart';
// import 'package:tims/util/constant.dart';
// import 'package:tims/widgets/simple_button.dart';

// import '../../theme/app_theme.dart';

// class Sample extends StatefulWidget {
//   const Sample({super.key});

//   @override
//   State<Sample> createState() => _SampleState();
// }

// class _SampleState extends State<Sample> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () {
//               print('object');
//               play(context);
//             },
//             child: Text('Check')),
//       ),
//     );
//   }

//   play(context) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           insetPadding: EdgeInsets.all(15),
//           shape: RoundedRectangleBorder(
//               side: BorderSide(color: Colors.black),
//               borderRadius: BorderRadius.circular(20.0)), //this right here
//           child: Container(
//             padding: EdgeInsets.only(top: 20, left: 15, right: 0),
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(20)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 15,
//                             width: 15,
//                             child: SvgPicture.asset(
//                               'assets/sampleAsset/filter_search.svg',
//                               fit: BoxFit.contain,
//                               color: Colors.orange,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // SizedBox(
//                     //   width: Constant.sizedBox1,
//                     // ),
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Filters',
//                             style: TextStyle(
//                                 color: Colors.orange,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // SizedBox(
//                     //   width: Constant.sizedBox1,
//                     // ),
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Reset Filter',
//                               style: TextStyle(
//                                   color: Colors.orange,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 line2(),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 tiles(),
//                 line2(),
//                 Container(
//                   height: 120,
//                   child: ListView.builder(
//                       itemCount: 2,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: EdgeInsets.all(5),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                   child: Row(
//                                 children: [
//                                   Container(
//                                     height: 15,
//                                     width: 15,
//                                     child: SvgPicture.asset(
//                                       icons2[index],
//                                       fit: BoxFit.contain,
//                                       color: Colors.orange,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(tile2[index])
//                                 ],
//                               )),
//                               Expanded(
//                                   child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 20, right: 20, top: 5),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     InkWell(
//                                       onTap: () async {
//                                         DateTime? date_picked =
//                                             await showDatePicker(
//                                                 context: context,
//                                                 initialDate: DateTime.now(),
//                                                 firstDate: DateTime(2022),
//                                                 lastDate: DateTime(
//                                                     2025, DateTime.august, 8));
//                                       },
//                                       child: Icon(
//                                         Icons.date_range,
//                                         color: Colors.amber,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ))
//                             ],
//                           ),
//                         );
//                       }),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget tiles() {
//     return Container(
//       height: 120,
//       child: ListView.builder(
//           itemCount: 4,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: EdgeInsets.all(5),
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: Row(
//                     children: [
//                       Container(
//                         height: 15,
//                         width: 15,
//                         child: SvgPicture.asset(
//                           icons[index],
//                           fit: BoxFit.contain,
//                           color: Colors.orange,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(title[index])
//                     ],
//                   )),
//                   Expanded(
//                       child: Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           n[index],
//                           style: TextStyle(fontSize: 12),
//                         )
//                       ],
//                     ),
//                   ))
//                 ],
//               ),
//             );
//           }),
//     );
//   }

//   List<String> tile2 = ['inquiry date', 'Event Date'];
//   List<String> icons2 = [
//     'assets/sampleAsset/calendar_tag.svg',
//     'assets/sampleAsset/calendar_edit.svg',
//   ];

//   List<String> title = ['onGoning', 'Cancelled', 'All', 'Booking'];
//   List<String> icons = [
//     'assets/sampleAsset/calendar_tag.svg',
//     'assets/sampleAsset/calendar_edit.svg',
//     'assets/sampleAsset/note_remove.svg',
//     'assets/sampleAsset/note_remove.svg',
//   ];
//   List<String> n = ['100', '300', '10', '420'];
//   Widget line2() {
//     return Container(
//       width: MediaQuery.of(context).size.width - 70,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           for (int i = 0; i < 80; i++) ...[
//             line(),
//             SizedBox(
//               width: 2,
//             )
//           ]
//         ],
//       ),
//     );
//   }

//   Widget line() {
//     return Container(
//       height: 2,
//       width: 2,
//       decoration: BoxDecoration(
//           color: Colors.orange, borderRadius: BorderRadius.circular(20)),
//     );
//   }
// }

// demo screen
