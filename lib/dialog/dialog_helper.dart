import 'package:flutter/material.dart';
import 'package:youneciohc/dialog/default_dialog.dart';

class DialogHelper {

  static void showCommonMessageDialog(BuildContext context, {bool? barrier, String? msg, Widget? icon, bool? showCancel, Function()? onConfirmClicked, Function()? onCancelClicked}) {
    showDialog(context: context,barrierDismissible: barrier ?? true, builder: (context) {
      String message = msg ?? "";
      bool cancelVisible = showCancel ?? true;

      return DefaultDialog(msg: message, icon: icon, cancelVisible: cancelVisible, confirmClicked: () {
        Navigator.pop(context);
        onConfirmClicked?.call();
      }, cancelClicked: () {
        Navigator.pop(context);
        if (onCancelClicked != null) {
          onCancelClicked.call();
        }
      },);
    });
  }

  static Future<bool?> showCommonMessageDialogFuture(BuildContext context, {String? msg, Widget? icon, bool? showCancel, Function()? onConfirmClicked, Function()? onCancelClicked}) {
    return showDialog<bool>(context: context, builder: (context) {
      String message = msg ?? "";
      bool cancelVisible = showCancel ?? true;

      return DefaultDialog(msg: message, icon: icon, cancelVisible: cancelVisible, confirmClicked: () {
        onConfirmClicked?.call();
        Navigator.pop(context, true);
      }, cancelClicked: () {
        if (onCancelClicked != null) {
          onCancelClicked.call();
        }

        Navigator.pop(context, false);
      },);
    });
  }

  static Future<CheckDialogResult?> showCheckMessageDialog(BuildContext context, {String? msg, Widget? icon,
    bool? showCancel, bool? checked, String? title, String? checkMsg} ) {

    return showDialog(context: context, builder: (context) {
      String message = msg ?? "";
      bool cancelVisible = showCancel ?? true;
      bool check = checked ?? false;
      String cMsg = checkMsg ?? "";

      CheckDialogResult result = CheckDialogResult(check, false);

      return DefaultCheckDialog(msg: message, icon: icon, cancelVisible: cancelVisible,
        title: title ?? "",
        checked: check, checkMessage: cMsg, confirmClicked: (checked) {
          result.checked = checked;
          result.yesClicked = true;
          Navigator.pop(context, result);
        }, cancelClicked: (checked) {
          result.checked = checked;
          result.yesClicked = false;
          Navigator.pop(context, result);
        },);
    });
  }

}

class CheckDialogResult {
  bool checked = false;
  bool yesClicked = false;

  CheckDialogResult(this.checked, this.yesClicked);
}