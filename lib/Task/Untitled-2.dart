//  booked
  //                       ? CustomCheckbox(
  //                           boxBorderRadius: 5,
  //                           checkColor: HexColor('#f02221'),
  //                           iconSize: 10,
  //                           onChanged: () {
  //                             setState(() {
  //                               current = !current;
  //                               if (venueBox.selected == true) {
  //                                 venueBox.selected = false;
  //                                 indexnew = 9;

  //                                 print(indexnew);
  //                               } else if (venueBox.selected == false) {
  //                                 venueBox.selected = true;
  //                                 indexnew = index2;
  //                               }

  //                               controller.update();
  //                             });
  //                           },
  //                           iconPadding: EdgeInsets.all(0),
  //                           space: 5,
  //                           title: controller.mYlist[0].result!.data![index2]
  //                               .venueSlot![index].slotName
  //                               .toString(),
  //                           fontWeight: FontWeight.w400,
  //                           textColor: Colors.black,
  //                           onChangeTextColor: HexColor('#f02221'),
  //                           textSize: 12,
  //                         )
  //                       : Row(
  //                           children: [
  //                             InkWell(
  //                               onTap: () {
  //                                 dialog(
  //                                     sloatName: venueBox.slotName.toString(),
  //                                     status: status);
  //                               },
  //                               child: SizedBox(
  //                                 height: 20,
  //                                 width: 20,
  //                                 child: Center(
  //                                   child: Icon(
  //                                     Icons.info_outlined,
  //                                     color: HexColor('#f02221'),
  //                                     size: 22,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                             const SizedBox(
  //                               width: Constant.sizedBox7,
  //                             ),
  //                             Text(
  //                               controller.mYlist[0].result!.data![index2]
  //                                   .venueSlot![index].slotName
  //                                   .toString(),
  //                               maxLines: 2,
  //                               style: TextStyle(
  //                                   color: booked
  //                                       ? HexColor('#f02221')
  //                                       : Colors.grey,
  //                                   fontSize: isTablet ? 6.sp : 1.5.h,
  //                                   fontWeight: FontWeight.w500),
  //                             ),
  //                           ],
  //                         )