
import 'package:flutter/material.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/strings.dart';
import 'package:tims/widgets/coustom_text.dart';

class NoDataFound extends StatelessWidget {
  final double? height;
  final double? width;

  const NoDataFound({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = height ?? MediaQuery.of(context).size.height - 70;
    var w = width ?? MediaQuery.of(context).size.width;
    if (w > h) {
      h = height != null
          ? height! / 1.2
          : MediaQuery.of(context).size.height / 1.2;
      w = width != null
          ? width! / 3.5
          : MediaQuery.of(context).size.width / 3.5;
    } else {
      h = height != null
          ? height! / 3.5
          : MediaQuery.of(context).size.height / 3.5;
      w = width != null
          ? width! / 1.2
          : MediaQuery.of(context).size.width / 1.2;
    }

    return Container(
      alignment: Alignment.center,
      height: height ?? MediaQuery.of(context).size.height - 70,
      width: width ?? MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                title: Strings.noDataFound,
                colors: AppTheme.colorPrimary,
                fontSize: AppTheme.medium,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
