import "package:flutter/material.dart";
import "package:tims/util/constant.dart";

class CircleGradient extends StatelessWidget {
  const CircleGradient(
      {super.key,
      required this.startcolor,
      required this.endcolor,
      required this.widget,
      required this.hw});
  final Color startcolor;
  final Color endcolor;
  final Widget widget;
  final double hw;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(Constant.TOO_MUCH_SMALL_PADDING),
        alignment: Alignment.center,
        height: hw,
        width: hw,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(hw),
            gradient: LinearGradient(
                colors: [startcolor, endcolor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: widget);
  }
}
