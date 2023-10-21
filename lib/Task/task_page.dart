// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sizer/sizer.dart';
// import 'package:tims/Task/Model/Response/ResponseModel.dart';
// import 'package:tims/Task/TaskController.dart';
// import 'package:tims/theme/app_theme.dart';
// import 'package:tims/util/constant.dart';
// import 'package:tims/util/hex_code.dart';
// import 'package:tims/widgets/coustom_text.dart';
// import 'package:tims/widgets/input_textfield.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'customCheckBox.dart';

// class Home2 extends StatefulWidget {
//   const Home2({super.key});

//   @override
//   State<Home2> createState() => _Home2State();
// }

// class _Home2State extends State<Home2> {
//   int value = 0;
//   int valuex = 0;
//   final controller = Get.put(TaskController());

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isTablate = SizerUtil.deviceType == DeviceType.tablet;

//     return GetBuilder<TaskController>(builder: (controller) {
//       // Future.delayed(const Duration(seconds: 2), () {
//       //   controller.isloading = false;
//       //   controller.update();
//       // });
//       return Sizer(builder: (context, orientation, dtype) {
//         return Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             title: const Text('Home2'),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               color: Colors.transparent,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [

//                     Padding(
//                       padding: EdgeInsets.only(
//                           left: isTablate ? 20.0 : 0,
//                           right: isTablate ? 20 : 0,
//                           top: isTablate ? 20 : 10),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(right: isTablate ? 10 : 0),
//                                 child: Column(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.all(20.0),
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color:
//                                                   Colors.grey.withOpacity(0.5),
//                                               blurRadius: 20,
//                                               spreadRadius: 0,
//                                             )
//                                           ]),
//                                       child: Column(
//                                         children: [
//                                           CircleAvatar(
//                                             radius: isTablate ? 8.w : 25.sp,
//                                             backgroundImage: NetworkImage(
//                                                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScbhdbVrb_nYy2Z2ArxEQHsEpJ12U2TRc64w&usqp=CAU'),
//                                           ),
//                                           const SizedBox(
//                                             height: Constant.sizedBox5,
//                                           ),
//                                           CustomText(
//                                             title: 'Birthday',
//                                             fontWeight: FontWeight.w500,
//                                             colors: Colors.black,
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Flexible(
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: isTablate ? 20 : 5),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       nameoffield('Host Name',
//                                           isTablet: isTablate,
//                                           bottomPadding: 5.0),
//                                       textfeild(
//                                           controller: controller.nameController,
//                                           readonly: false,
//                                           hintText: 'Full Name'),
//                                       const SizedBox(
//                                         height: Constant.sizedBox5,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                               child: Column(
//                                             children: [
//                                               nameoffield(
//                                                 'PAX.',
//                                                 bottomPadding: 5.0,
//                                                 isTablet: isTablate,
//                                               ),
//                                               textfeild(
//                                                   controller:
//                                                       controller.paxController,
//                                                   hintText: '500000',
//                                                   readonly: true,
//                                                   textInputType:
//                                                       TextInputType.number,
//                                                   maxlength: 8),
//                                             ],
//                                           )),
//                                           const SizedBox(
//                                             width: Constant.sizedBox7,
//                                           ),
//                                           Expanded(
//                                               child: Column(
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               nameoffield('Event Date',
//                                                   bottomPadding: 5.0,
//                                                   isTablet: isTablate),
//                                               CoustomTextField(
//                                                 // readonly: false,
//                                                 fontSize: 12,
//                                                 borderEnableColors:
//                                                     AppTheme.textfeildColor,
//                                                 fillColor:
//                                                     AppTheme.textfeildColor,
//                                                 contentPadding: EdgeInsets.zero,
//                                                 prefixIcon: InkWell(
//                                                   onTap: () async {
//                                                     DateTime? datePicked =
//                                                         await showDatePicker(
//                                                             context: context,
//                                                             initialDate:
//                                                                 DateTime.now(),
//                                                             firstDate:
//                                                                 DateTime(2022),
//                                                             lastDate: DateTime(
//                                                                 2025,
//                                                                 DateTime.august,
//                                                                 8));
//                                                     setState(() {
//                                                       controller.datecontroller
//                                                           .text = DateFormat(
//                                                               'yyyy-MM-dd')
//                                                           .format(datePicked!);
//                                                     });
//                                                   },
//                                                   child: Icon(
//                                                     Icons.date_range,
//                                                   ),
//                                                 ),
//                                                 onTextValidator:
//                                                     (String? value) {},
//                                                 // controller:
//                                                 //     controller.datecontroller,
//                                                 // textInputType:
//                                                 //     TextInputType.number,
//                                                 // maxlength: 10, onTextValidator: (String? value) {  },
//                                               ),
//                                             ],
//                                           ))
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: Constant.sizedBox7,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 20, right: 20),
//                                 child: Row(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           this.valuex = 1;
//                                           controller.nextWidget = false;
//                                         });
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                             border: Border.all(
//                                                 width: 1.2,
//                                                 color: valuex == 1
//                                                     ? HexColor('#f02221')
//                                                     : AppTheme.colorBlack
//                                                         .withOpacity(0.2))),
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(7.5),
//                                             border: Border.all(
//                                                 color: Colors.white, width: 2),
//                                             color: valuex == 1
//                                                 ? HexColor('#f02221')
//                                                 : Colors.white,
//                                           ),
//                                           height: 20,
//                                           width: 20,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     nameoffield('Indoor Event',
//                                         isTablet: isTablet, bottomPadding: 0)
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 20, right: 20),
//                                 child: Row(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           this.valuex = 2;
//                                           controller.nextWidget = true;
//                                         });
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                             border: Border.all(
//                                                 width: 1.2,
//                                                 color: valuex == 2
//                                                     ? HexColor('#f02221')
//                                                     : AppTheme.colorBlack
//                                                         .withOpacity(0.2))),
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(7.5),
//                                             border: Border.all(
//                                                 color: Colors.white, width: 2),
//                                             color: valuex == 2
//                                                 ? HexColor('#f02221')
//                                                 : Colors.white,
//                                           ),
//                                           height: 20,
//                                           width: 20,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     nameoffield('Outdoor Event',
//                                         isTablet: isTablet, bottomPadding: 0)
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     controller.nextWidget
//                         ? Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 nameoffield('Venue Name',
//                                     isTablet: isTablet, bottomPadding: 10),
//                                 textfeild(readonly: false),
//                                 SizedBox(
//                                   height: Constant.sizedBox4,
//                                 ),
//                                 nameoffield('Address',
//                                     isTablet: isTablet, bottomPadding: 10),
//                                 textfeild(readonly: false),
//                                 SizedBox(
//                                   height: Constant.sizedBox4,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Column(
//                                         children: [
//                                           nameoffield('Contact Name',
//                                               isTablet: isTablet,
//                                               bottomPadding: 10),
//                                           textfeild(readonly: false),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: Constant.sizedBox4,
//                                     ),
//                                     Expanded(
//                                       child: Column(
//                                         children: [
//                                           nameoffield('Contact Number',
//                                               isTablet: isTablet,
//                                               bottomPadding: 10),
//                                           Row(
//                                             children: [
//                                               Expanded(
//                                                   flex: 1,
//                                                   child: textfeild(
//                                                       readonly: false)),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Expanded(
//                                                   flex: 2,
//                                                   child: textfeild(
//                                                       readonly: false)),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           )
//                         : Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                       left: isTablate ? 38 : 28,
//                                       top: isTablate ? 35 : 25,
//                                       bottom: 15,
//                                     ),
//                                     child: RichText(
//                                         text: TextSpan(
//                                             text: 'Recommended ',
//                                             style: TextStyle(
//                                                 color: Colors.black87,
//                                                 fontSize:
//                                                     isTablate ? 8.sp : 12.sp,
//                                                 fontWeight: FontWeight.w400),
//                                             children: [
//                                           TextSpan(
//                                               text: ' Venue Options',
//                                               style: TextStyle(
//                                                   color: HexColor('#f02221'))),
//                                         ])),
//                                   )
//                                 ],
//                               ),
//                               controller.isloading
//                                   ? shimmerEffect()
//                                   : venueList(),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                       left: isTablate ? 38 : 28,
//                                       top: isTablate ? 35 : 25,
//                                       bottom: 15,
//                                     ),
//                                     child: RichText(
//                                         text: TextSpan(
//                                             text: 'Other ',
//                                             style: TextStyle(
//                                                 color: Colors.black87,
//                                                 fontSize:
//                                                     isTablate ? 8.sp : 12.sp,
//                                                 fontWeight: FontWeight.w400),
//                                             children: [
//                                           TextSpan(
//                                               text: ' Venue Options',
//                                               style: TextStyle(
//                                                   color: HexColor('#f02221'))),
//                                         ])),
//                                   )
//                                 ],
//                               ),
//                               venueList(),
//                             ],
//                           )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       });
//     });
//   }

//   Widget shimmerEffect() {
//     return StaggeredGridView.countBuilder(
//         crossAxisCount: (isTablet ? 3 : 2),
//         crossAxisSpacing: 5,
//         physics: const ClampingScrollPhysics(),
//         shrinkWrap: true,
//         mainAxisSpacing: 5,
//         itemCount: 6,
//         staggeredTileBuilder: (index) {
//           return const StaggeredTile.fit(1);
//         },
//         itemBuilder: (context, int index) {
//           return Container(
//             width: MediaQuery.of(context).size.width / 2.3,
//             height: MediaQuery.of(context).size.height / 12,
//             decoration: BoxDecoration(
//               color: Colors.grey,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10, top: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Shimmer.fromColors(
//                         highlightColor: Colors.white,
//                         baseColor: Colors.grey.shade300,
//                         child: Container(
//                           height: 10,
//                           width: 50,
//                           color: Colors.grey.shade300,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Shimmer.fromColors(
//                       highlightColor: Colors.white,
//                       baseColor: Colors.grey.shade300,
//                       child: Container(
//                         height: 10,
//                         width: 50,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Shimmer.fromColors(
//                       highlightColor: Colors.white,
//                       baseColor: Colors.grey.shade300,
//                       child: Container(
//                         height: 10,
//                         width: 50,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Shimmer.fromColors(
//                       highlightColor: Colors.white,
//                       baseColor: Colors.grey.shade300,
//                       child: Container(
//                         height: 10,
//                         width: 50,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   Widget venueList() {
//     return StaggeredGridView.countBuilder(
//         crossAxisCount: (isTablet ? 3 : 2),
//         crossAxisSpacing: isTablet ? 5 : 0,
//         physics: const ClampingScrollPhysics(),
//         shrinkWrap: true,
//         mainAxisSpacing: isTablet ? 5 : 0,
//         itemCount: controller.lstData!.length,
//         staggeredTileBuilder: (index) {
//           return const StaggeredTile.fit(1);
//         },
//         itemBuilder: (context, int index) {
//           String status = controller.lstData![index].bookingStatus.toString();

//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: Column(
//               children: [
//                 Theme(
//                   data: Theme.of(context).copyWith(
//                     dividerColor: Colors.transparent,
//                   ),
//                   child: Card(
//                     color: Colors.white,
//                     elevation: 5,
//                     shape: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide:
//                             const BorderSide(color: Colors.transparent)),
//                     child: ListTileTheme(
//                       tileColor: index == indexnew
//                           ? HexColor('#fff6f5')
//                           : Colors.white,
//                       shape: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide:
//                               const BorderSide(color: Colors.transparent)),
//                       child: ExpansionTile(
//                         tilePadding: const EdgeInsets.only(
//                           left: 15,
//                           right: 5,
//                         ),
//                         trailing: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 5.0),
//                               child: Text(
//                                 controller.lstData![index].bookingStatus
//                                     .toString(),
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: status == 'Blocked'
//                                         ? HexColor('#f02221')
//                                         : status == 'Available'
//                                             ? HexColor('#f02221')
//                                             : status == 'Booked'
//                                                 ? HexColor('#9f8a1e')
//                                                 : status == 'Partial Available'
//                                                     ? HexColor('#eea210')
//                                                     : HexColor('#eea210')),
//                               ),
//                             ),

//                             // pending widget
//                             index == indexnew
//                                 ? Padding(
//                                     padding: const EdgeInsets.only(bottom: 8.0),
//                                     child: Container(
//                                       padding: const EdgeInsets.all(2),
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           border: Border.all(
//                                               color: HexColor('#f02221'),
//                                               width: 1)),
//                                       child: Icon(
//                                         Icons.check,
//                                         color: HexColor('#f02221'),
//                                         size: 7.5,
//                                       ),
//                                     ),
//                                   )
//                                 : Text('')
//                           ],
//                         ),
//                         title: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '${controller.lstData![index].name}',
//                               style: TextStyle(
//                                   fontSize: isTablet ? 5.sp : 10.sp,
//                                   color: Colors.black),
//                             ),
//                             const SizedBox(
//                               height: 1.5,
//                             ),
//                             Text(
//                               'Capacity : ${controller.lstData![index].maxPax}',
//                               style: TextStyle(
//                                   wordSpacing: 1,
//                                   fontSize: isTablet ? 5.sp : 10.sp,
//                                   color: HexColor('#b9b9b9')),
//                             ),
//                           ],
//                         ),
//                         children: [
//                           Center(
//                             child: expanSionBodyContent(
//                                 controller.lstData![index], index),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   int indexnew = 100000;
//   Widget expanSionBodyContent(Data data, index2) {
//     return StaggeredGridView.countBuilder(
//         padding: const EdgeInsets.only(left: 15, top: 5),
//         crossAxisCount: data.venueSlot!.length == 1 ? 1 : 2,
//         crossAxisSpacing: 5,
//         physics: const ClampingScrollPhysics(),
//         shrinkWrap: true,
//         mainAxisSpacing: 5,
//         itemCount: data.venueSlot!.length,
//         staggeredTileBuilder: (index) {
//           return const StaggeredTile.fit(1);
//         },
//         itemBuilder: (context, int index) {
//           var venueBox = data.venueSlot![index];

//           bool booked = venueBox.bookingDetail == null;
//           return Padding(
//             padding: EdgeInsets.only(
//                 bottom: 5, left: data.venueSlot!.length == 1 ? 50.0 : 0.0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     booked
//                         ? CustomCheckbox(
//                             checked: venueBox.selected != null
//                                 ? venueBox.selected!
//                                 : false,
//                             boxBorderRadius: 5,
//                             checkColor: HexColor('#f02221'),
//                             iconSize: 10,
//                             onTap: () {
//                               print(" oktest 1");
//                               if (controller.lstData![index2].venueSlot![index]
//                                       .selected !=
//                                   null) {
//                                 controller.lstData![index2].venueSlot![index]
//                                         .selected =
//                                     !controller.lstData![index2]
//                                         .venueSlot![index].selected!;
//                                 indexnew = index2;
//                               } else {
//                                 controller.lstData![index2].venueSlot![index]
//                                     .selected = true;

//                                 indexnew = 9;
//                               }

//                               controller.update();
//                             },
//                             iconPadding: const EdgeInsets.all(0),
//                             space: 5,
//                             title: venueBox.slotName.toString(),
//                             fontWeight: FontWeight.w400,
//                             textColor: Colors.black,
//                             onChangeTextColor: HexColor('#f02221'),
//                             textSize: 12,
//                           )
//                         : Row(
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   dialog(
//                                       sloatName: venueBox.slotName.toString(),
//                                       status: data.bookingStatus);
//                                 },
//                                 child: SizedBox(
//                                   height: 20,
//                                   width: 20,
//                                   child: Center(
//                                     child: SvgPicture.asset(
//                                         'assets/images/info-circle.svg'),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: Constant.sizedBox7,
//                               ),
//                               Text(
//                                 venueBox.slotName.toString(),
//                                 maxLines: 2,
//                                 style: TextStyle(
//                                     color: booked
//                                         ? HexColor('#f02221')
//                                         : Colors.grey,
//                                     fontSize: isTablet ? 6.sp : 1.5.h,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       '${venueBox.fromTime.toString()} - ${venueBox.toTime.toString()}',
//                       style:
//                           TextStyle(fontSize: 11, color: HexColor('#dfdfdf')),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           );
//         });
//   }

//   Widget nameoffield(String fieldname,
//       {required bool isTablet, required double bottomPadding}) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: bottomPadding),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(
//             fieldname,
//             style: TextStyle(
//                 color: Colors.black,
//                 fontSize: isTablet ? 7.sp : 12,
//                 fontWeight: FontWeight.normal),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget textfeild(
//       {required bool readonly,
//       Widget? suffixicon,
//       String? hintText,
//       TextInputType? textInputType,
//       TextEditingController? controller,
//       int? maxlength}) {
//     return CoustomTextField(
//         keyboardType: textInputType,
//         textEditingController: controller,
//         maxLength: maxlength,
//         hintText: hintText,
//         prefixIcon: suffixicon,
//         borderEnableColors: AppTheme.textfeildColor,
//         fillColor: AppTheme.textfeildColor,
//         borderFocusColors: AppTheme.textfeildColor,
//         textInputAction: TextInputAction.done,
//         cursorColor: AppTheme.colorBlack,
//         onChanged: (String? value) {},
//         onTextValidator: (String? value) {
//           if (value!.isEmpty) {
//             return 'invalid';
//           }
//           return null;
//         },
//         borderCorner: 8,
//         contentPadding: EdgeInsets.symmetric(
//           vertical: isTablet ? 2.5.w : 4.w,
//           horizontal: isTablet ? 3.0.w : 4.2.w,
//         ),
//         readOnly: readonly);
//   }

//   Future dialog({required String sloatName, status}) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext) {
//           return AlertDialog(
//               elevation: 0,
//               backgroundColor: Colors.transparent,
//               shape: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                   borderSide: BorderSide(color: Colors.transparent)),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 12, bottom: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: Text(
//                             'Close',
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 10.sp),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: const EdgeInsets.all(18),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.white),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 sloatName,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 13.sp),
//                               ),
//                               Text(
//                                 status,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 8.sp,
//                                     color: status == 'Blocked'
//                                         ? HexColor('#f02221')
//                                         : status == 'Available'
//                                             ? HexColor('#f02221')
//                                             : status == 'Booked'
//                                                 ? HexColor('#9f8a1e')
//                                                 : status == 'Partial Available'
//                                                     ? HexColor('#eea210')
//                                                     : HexColor('#eea210')),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(7),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(
//                                   color: Colors.black.withOpacity(0.2))),
//                           child: Row(
//                             children: [
//                               Column(
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(15),
//                                         border: Border.all(
//                                             color: Colors.transparent)),
//                                     padding: EdgeInsets.all(0.2),
//                                     child: Center(
//                                         child: SvgPicture.asset(
//                                             'assets/images/profile-circle.svg')),
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: Constant.sizedBox7,
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'Mukesh Dhirubhai Ambani',
//                                         style: TextStyle(
//                                             fontSize: isTablet ? 6.sp : 1.5.h,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text('Client Name',
//                                           style: TextStyle(
//                                               color:
//                                                   Colors.black.withOpacity(0.2),
//                                               fontSize:
//                                                   isTablet ? 5.sp : 1.5.h)),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(7),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(
//                                   color: Colors.black.withOpacity(0.2))),
//                           child: Row(
//                             children: [
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(15),
//                                         border: Border.all(
//                                             color: Colors.transparent)),
//                                     padding: EdgeInsets.all(0.2),
//                                     child: Center(
//                                         child: SvgPicture.asset(
//                                             'assets/images/profile-circle.svg')),
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: Constant.sizedBox7,
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'Mukesh Dhirubhai Ambani',
//                                         style: TextStyle(
//                                             fontSize: isTablet ? 6.sp : 1.5.h,
//                                             height: 0.8,
//                                             fontWeight: FontWeight.bold),
//                                       )
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text('Client Name',
//                                           style: TextStyle(
//                                               color:
//                                                   Colors.black.withOpacity(0.2),
//                                               fontSize:
//                                                   isTablet ? 5.sp : 1.5.h)),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ));
//         });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Demopage extends StatefulWidget {
  const Demopage({super.key});

  @override
  State<Demopage> createState() => _DemopageState();
}

class _DemopageState extends State<Demopage> {
  ScrollController controller = ScrollController();
  // additem() async {
  //   controller.addListener(() {
  //     if (controller.position.maxScrollExtent == controller.position.pixels) {
  //       print('object');
  //     }
  //   });
  // }

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        print('object');
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 500,
        width: 250,
        child: ListView.builder(
            controller: controller,
            itemCount: 50,
            itemBuilder: (context, index) {
              return Text('data');
            }),
      ),
    );
  }
}
