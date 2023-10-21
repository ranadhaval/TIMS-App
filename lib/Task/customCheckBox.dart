import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  Color checkColor;
  double height;
  double width;

  double iconSize;
  double boxBorderRadius;
  Color boxBorderColor;
  double space;
  EdgeInsetsGeometry iconPadding;
  String title;
  FontWeight fontWeight;
  double opacity;
  Color onChangeTextColor;
  Color textColor;
  double textSize;
  bool checked;
  final Function()? onTap;

  CustomCheckbox(
      {super.key,
      required this.checkColor,
      this.height = 17,
      this.width = 17,
      required this.iconSize,
      required this.boxBorderRadius,
      this.boxBorderColor = Colors.black,
      this.opacity = 0.2,
      required this.iconPadding,
      required this.space,
      this.title = 'CHECK BOX',
      required this.fontWeight,
      required this.onChangeTextColor,
      required this.textColor,
      required this.textSize,
      required this.checked,
      required this.onTap});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap, //,
      // onTap: () {
      //   try {
      //     widget.onChanged;
      //     setState(() {
      //       widget.checked = !widget.checked;
      //     });
      //   } catch (e) {
      //     print(e);
      //   }
      // },
      child: Row(
        children: [
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                color: widget.checked ? widget.checkColor : Colors.white,
                border: Border.all(
                    color: widget.checked
                        ? widget.checkColor
                        : widget.boxBorderColor.withOpacity(widget.opacity)),
                borderRadius: BorderRadius.circular(widget.boxBorderRadius)),
            child: Padding(
              padding: widget.iconPadding,
              child: Center(
                child: Icon(
                  Icons.check,
                  size: widget.iconSize,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: widget.space,
          ),
          Text(
            widget.title,
            style: TextStyle(
                fontWeight: widget.fontWeight,
                fontSize: widget.textSize,
                color: widget.checked
                    ? widget.onChangeTextColor
                    : widget.textColor),
          )
        ],
      ),
    );
  }
}
