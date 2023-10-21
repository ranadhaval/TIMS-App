import 'package:flutter/material.dart';
import 'package:tims/theme/app_theme.dart';
import 'package:tims/util/extensions.dart';

class AlertDialogHelper extends StatefulWidget {
  late String title;
  late String message;
  late String positiveBtnText;
  late String negativeBtnText;
  late VoidCallback positiveBtnClick;
  late VoidCallback negativeBtnClick;

  AlertDialogHelper(
      {Key? key,
      title = '',
      message = '',
      positiveBtnText = '',
      negativeBtnText = '',
      positiveBtnClick,
      negativeBtnClick})
      : super(key: key) {
    this.title = title;
    this.message = message;
    this.positiveBtnText = positiveBtnText;
    this.negativeBtnText = negativeBtnText;
    this.positiveBtnClick = positiveBtnClick;
    this.negativeBtnClick = negativeBtnClick;
  }

  @override
  State<AlertDialogHelper> createState() => _AlertDialogHelperState();
}

class _AlertDialogHelperState extends State<AlertDialogHelper> {
  @override
  Widget build(BuildContext context) {
    // set up the buttons
    List<Widget> actions = [];
    if (!widget.negativeBtnText.isNullOrEmpty()) {
      Widget negativeButton = TextButton(
        onPressed: widget.negativeBtnClick,
        child: Text(
          widget.negativeBtnText,
          style: TextStyle(
              color: AppTheme.colorPrimary,
              fontSize: AppTheme.medium,
              fontWeight: FontWeight.normal),
        ),
      );
      actions.add(negativeButton);
    }
    if (!widget.positiveBtnText.isNullOrEmpty()) {
      Widget positiveButton = TextButton(
        onPressed: widget.positiveBtnClick,
        child: Text(
          widget.positiveBtnText,
          style: TextStyle(
              color: AppTheme.colorPrimary,
              fontSize: AppTheme.medium,
              fontWeight: FontWeight.normal),
        ),
      );
      actions.add(positiveButton);
    }

    return AlertDialog(
      title: Visibility(
          visible: !widget.title.isNullOrEmpty(),
          child: Text(
            widget.title,
            style: const TextStyle(
                fontSize: AppTheme.large, fontWeight: FontWeight.w600),
          )),
      content: Visibility(
        visible: !widget.message.isNullOrEmpty(),
        child: Text(widget.message),
      ),
      actions: actions,
    );
  }
}
