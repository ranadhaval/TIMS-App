import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/constant.dart';

class CoustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;

  final Widget? prefixIcon;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? onTextValidator;
  final bool obscureText;
  final int maxLines;
  final Function()? onTextFiledOnTap;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final double borderCorner;
  final Color? borderEnableColors;
  final Color? borderFocusColors;
  final Color? fillColor;
  final Color? cursorColor;
  final Color? textColor;
  final Color? hintColor;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  CoustomTextField({
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.textEditingController,
    this.onChanged,
    this.obscureText = false,
    this.maxLines = 1,
    this.onTextFiledOnTap,
    required this.onTextValidator,
    this.readOnly = false,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.borderEnableColors,
    this.borderFocusColors,
    this.fillColor,
    this.cursorColor,
    this.textColor,
    this.textAlign,
    this.contentPadding,
    this.fontSize,
    this.fontWeight,
    this.maxLength,
    this.inputFormatters,
    this.hintColor,
    this.borderCorner = Constant.BTN_ROUNDED_CORNER,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: TextFormField(
        cursorColor: cursorColor ?? AppTheme.colorPrimary,
        textAlign: textAlign ?? TextAlign.start,
        focusNode: focusNode,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: (inputFormatters != null) ? inputFormatters : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: labelText,
            contentPadding: contentPadding,
            prefixIcon: prefixIcon ?? null,
            suffixIcon: suffixIcon ?? null,
            filled: true,
            isCollapsed: true,
            isDense: true,
            hoverColor: Colors.white,
            fillColor: fillColor ?? AppTheme.colorWhite,
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderCorner),
              borderSide: BorderSide(color: AppTheme.colorPrimary, width: 1.0),
            ),
            focusColor: Colors.transparent,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderCorner),
              borderSide: BorderSide(
                  color: borderFocusColors ?? AppTheme.colorPrimary,
                  width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderCorner),
              borderSide: BorderSide(
                color: borderEnableColors ?? AppTheme.colorIconGrey,
                width: 1.0,
              ),
            ),
            //labelText: labelText,
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: AppTheme.small,
                fontWeight: FontWeight.normal,
                height: 1,
                color: hintColor ?? AppTheme.colorBlack.withOpacity(0.2)),
            alignLabelWithHint: true,
            labelStyle: TextStyle(
              color: AppTheme.colorBlack.withOpacity(0.3),
              fontSize: AppTheme.medium,
              fontWeight: FontWeight.normal,
              height: 1,
              fontFamily: AppTheme.appFontName,
              decoration: TextDecoration.none,
            ),
            errorStyle: TextStyle(
              color: AppTheme.colorError,
              fontWeight: FontWeight.normal,
              fontSize: AppTheme.errorSize,
            ),
            errorMaxLines: 3),
        style: TextStyle(
          color: readOnly
              ? textColor ?? AppTheme.colorBlack
              : textColor ?? AppTheme.colorBlack,
          fontSize: fontSize ?? AppTheme.medium,
          fontWeight: fontWeight ?? FontWeight.w300,
          height: 1,
          fontFamily: AppTheme.appFontName,
          decoration: TextDecoration.none,
        ),
        keyboardType: keyboardType,
        readOnly: readOnly,
        obscureText: obscureText,
        maxLines: maxLines > 1 ? null : 1,
        maxLength: maxLength ?? null,
        onChanged: onChanged,
        onTap: onTextFiledOnTap,
        controller: textEditingController,
        validator: onTextValidator,
        textInputAction: textInputAction,
      ),
    );
  }
}
