
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';

class SimpleButton extends StatelessWidget {
  final Widget child;
  final Color bgColors;
  final Color borderColors;
  final Function() onTap;
  final double radius;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;

  const SimpleButton({
    required this.child,
    this.bgColors = AppTheme.colorPrimaryTheme,
    this.borderColors = AppTheme.colorPrimaryTheme,
    required this.onTap,
    this.radius = Constant.BTN_ROUNDED_CORNER,
    this.height,
    this.contentPadding,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      fixedSize: height != null ? Size.fromHeight(height!) : null,
      backgroundColor: bgColors,
      alignment: Alignment.center,
      padding: contentPadding,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          side: BorderSide(color: borderColors)),
    );
    return TextButton(
      style: flatButtonStyle,
      onPressed: onTap,
      child: child,
    );
  }
}
