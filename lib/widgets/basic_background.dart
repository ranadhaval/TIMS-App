import 'package:flutter/material.dart';
import 'package:tims/util/resources.dart';

class BasicBackground extends StatelessWidget {
  BasicBackground({super.key, this.height});
  double? height;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          SizedBox(
            height: height ?? MediaQuery.of(context).size.height * .22,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              screenBG,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
          ))
        ],
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          gradiant,
          fit: BoxFit.fitWidth,
        ),
      )
    ]);
  }
}
