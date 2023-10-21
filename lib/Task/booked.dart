    //  booked
    //                     ? SizedBox(
    //                         height: 25,
    //                         width: 20,
    //                         child: Checkbox(
    //                           side: BorderSide(color: HexColor('#b9b9b9')),
    //                           shape: RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(5)),
    //                           value: venueBox.selected,
    //                           onChanged: (value) {
    //                             setState(() {
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
    //                           activeColor: HexColor('#f02221'),
    //                         ),
    //                       )
    //                     : InkWell(
    //                         onTap: () {
    //                           dialog(
    //                               sloatName: venueBox.slotName.toString(),
    //                               status: status);
    //                         },
    //                         child: SizedBox(
    //                           height: 20,
    //                           width: 20,
    //                           child: Center(
    //                             child: Icon(
    //                               Icons.info_outlined,
    //                               color: HexColor('#f02221'),
    //                               size: 22,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                 const SizedBox(
    //                   width: Constant.sizedBox7,
    //                 ),
    //                 Text(
    //                   controller.mYlist[0].result!.data![index2]
    //                       .venueSlot![index].slotName
    //                       .toString(),
    //                   maxLines: 2,
    //                   style: TextStyle(
    //                       color: booked ? HexColor('#f02221') : Colors.grey,
    //                       fontSize: isTablet ? 6.sp : 1.5.h,
    //                       fontWeight: FontWeight.w500),
    //                 ),
                  