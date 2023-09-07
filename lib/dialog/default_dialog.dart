import 'package:flutter/material.dart';
import 'package:youneciohc/base/app_style.dart';
import 'package:youneciohc/widgets/commons/marginable.dart';

class DefaultDialog extends StatelessWidget {

  final String title;
  final String msg;
  final Widget? icon;
  final bool cancelVisible;
  final DialogStyle? dialogStyle;
  final Function()? cancelClicked;
  final Function()? confirmClicked;

  const DefaultDialog({Key? key, this.title="", this.msg="", this.icon, this.cancelVisible=false, this.dialogStyle,
    this.cancelClicked, this.confirmClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DialogStyle? style = dialogStyle ?? AppStyle.dialogStyles.commonAlertDialog;

    return Dialog(
        backgroundColor: style?.bgColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: _createBody(context, style)
    );
  }

  Widget _createBody(BuildContext context, DialogStyle? style) {
    Widget iconWidget = icon ?? AppStyle.emptyWidget;
    Widget msgWidget = (msg.isEmpty) ? const SizedBox.shrink() : Marginable.symmetric(Text(msg, style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w800)), vertical: 20);
    Widget cancelButton = TextButton(onPressed: cancelClicked, style: style?.cancelButtonStyle, child: Text("취소", style: style?.cancelTextStyle,));
    Widget confirmButton = TextButton(onPressed: confirmClicked, style: style?.confirmButtonStyle, child: Text("확인", style: style?.confirmTextStyle,));

    Widget buttons = Marginable.ltrb(Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility(visible: cancelVisible, child: Expanded(child: cancelButton),),
        Expanded(child: confirmButton),
      ],
    ), top: 8, height: 60);

    Widget content = Padding(padding: EdgeInsets.all(12), child: Column(
      // direction: Axis.vertical,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        iconWidget,
        msgWidget,
      ],
    ));

    return Column(mainAxisSize: MainAxisSize.min, children: [content, buttons],);
  }
}

class DefaultCheckDialog extends StatelessWidget {
  final String title;
  final String msg;
  final Widget? icon;
  final bool cancelVisible;
  final String checkMessage;
  bool checked;
  final DialogStyle? dialogStyle;
  final Function(bool)? cancelClicked;
  final Function(bool)? confirmClicked;

  DefaultCheckDialog({Key? key, this.title="", this.msg="", this.icon, this.cancelVisible=false,
    this.checkMessage="", this.checked = false, this.dialogStyle,
    this.cancelClicked, this.confirmClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DialogStyle? style = dialogStyle ?? AppStyle.dialogStyles.commonAlertDialog;

    return Dialog(
        backgroundColor: style?.bgColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: _createBody(context, style));
  }

  Widget _createBody(BuildContext context, DialogStyle? style) {
    Widget iconWidget = icon ?? AppStyle.emptyWidget;
    Widget titleText = Text(title, style: style?.titleStyle);
    Widget titleWidget = Row(mainAxisSize: MainAxisSize.min, children: [iconWidget,
      const SizedBox(width: 12), titleText]);

    _CheckController checkController = _CheckController(value: checked);;

    Widget msgWidget = (msg.isEmpty) ? const SizedBox.shrink() : Marginable.symmetric(Text(msg, style: style?.contentStyle), vertical: 12);
    Widget cancelButton = TextButton(onPressed: () {
      cancelClicked?.call(checkController.value);
    }, style: style?.cancelButtonStyle, child: Text("Not Use", style: style?.cancelTextStyle,));
    Widget confirmButton = TextButton(onPressed: () {
      confirmClicked?.call(checkController.value);
    }, style: style?.confirmButtonStyle, child: Text("To Use", style: style?.confirmTextStyle,));

    Widget checkWidget = _CheckWidget(checkMessage, checkController);

    Widget buttons = Marginable.ltrb(Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility(visible: cancelVisible, child: Expanded(child: cancelButton),),
        Expanded(child: confirmButton),
      ],
    ), top: 0, height: 60);

    Widget content = Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 14),
        titleWidget,
        const SizedBox(height: 12),
        msgWidget,
        checkWidget,
      ],
    ));

    return Column(mainAxisSize: MainAxisSize.min, children: [
      content,
      const SizedBox(height: 14),
      buttons,],);
  }
}

class _CheckWidget extends StatefulWidget {
  final String message;
  _CheckController controller;

  _CheckWidget(this.message, this.controller);

  @override
  State<StatefulWidget> createState() {
    return _CheckWidgetState();
  }
}

class _CheckWidgetState extends State<_CheckWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(value: widget.controller.value,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        title: Text(widget.message, style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)), onChanged: _handleCheckChanged);
  }

  void _handleCheckChanged(bool? checked) {
    if (checked == null) return;
    setState(() {
      widget.controller.value = checked;
    });
  }
}

class _CheckController {
  bool value;

  _CheckController({this.value=false});
}