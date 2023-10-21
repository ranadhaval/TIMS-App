import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';
import 'package:tims/widgets/circle_gradient.dart';

class MyRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String text;
  final ValueChanged<T?> onChanged;

  const MyRadioOption({
    required this.value,
    required this.groupValue,
    required this.text,
    required this.onChanged,
  });

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: isSelected
              ? BorderSide(
                  color: Colors.transparent,
                )
              : BorderSide(
                  color: Colors.grey,
                ),
        ),
      ),
      child: isSelected
          ? CircleGradient(
              startcolor: AppTheme.colorquemarkstart,
              endcolor: AppTheme.colorquemarkend,
              widget: Icon(
                Icons.done,
                color: AppTheme.colorWhite,
                size: Constant.RADIO_BTN_ICON_SIZE.sp,
              ),
              hw: Constant.RADIO_BTN_SIZE.sp,
            )
          : SizedBox(
              height: Constant.RADIO_BTN_SIZE.sp,
              width: Constant.RADIO_BTN_SIZE.sp,
            ),
    );
  }

  Widget _buildText() {
    final bool isSelected = value == groupValue;
    return Text(
      text,
      style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: Constant.TRAININGTRAILINGTEXTSIZE.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLabel(),
            const SizedBox(width: Constant.OPTION_FIXED_SPACE),
            _buildText(),
          ],
        ),
      ),
    );
  }
}
