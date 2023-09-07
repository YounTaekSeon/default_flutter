import 'package:flutter/material.dart';
import 'package:youneciohc/base/dimens.dart';

class AppStyle {
  static const defaultAniDuration = Duration(milliseconds: 150);

  static final Widget bigColoredDivider = Container(
    color: const Color(0xfff2f2f2),
    height: Dimens.dividerMiddle,
  );

  static const Widget emptyWidget = SizedBox.shrink();

  static final TextStyles text = TextStyles(
    mainBarTitle: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w800,
        color: Colors.blue),
  );

  static final ButtonStyles buttonstyles = ButtonStyles(
    coloredOutlinedButton: OutlinedButton.styleFrom(side: (const BorderSide(color: Colors.black, width: 2.0, style: BorderStyle.solid))),
  );

  static final DialogStyles dialogStyles = DialogStyles(
      commonAlertDialog: DialogStyle(
        titleStyle: text.subItemText,
        confirmTextStyle: text.middleColoredBg,
        cancelTextStyle: text.middleColoredBg,
      ));
}

class TextStyles {
  final TextStyle? subItemText;
  final TextStyle? middleColoredBg;
  final TextStyle? mainBarTitle;
  TextStyles({
    this.subItemText,
    this.middleColoredBg,
    this.mainBarTitle,
  });
}

class DialogStyles {
  final DialogStyle? commonAlertDialog;

  DialogStyles({this.commonAlertDialog});
}

class DialogStyle {
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final ButtonStyle? cancelButtonStyle;
  final ButtonStyle? confirmButtonStyle;
  final TextStyle? cancelTextStyle;
  final TextStyle? confirmTextStyle;
  final Color? bgColor;

  DialogStyle(
      {this.titleStyle,
        this.contentStyle,
        this.cancelButtonStyle,
        this.confirmButtonStyle,
        this.cancelTextStyle,
        this.confirmTextStyle,
        this.bgColor});
}

// class DialogStyle {
//   commonAlertStyle;
// }

class ButtonStyles {
  final ButtonStyle? confirmButton;
  final ButtonStyle? coloredOutlinedButton;
  final ButtonStyle? agreeAndContinueButton;

  ButtonStyles({
    this.confirmButton,
    this.coloredOutlinedButton,
    this.agreeAndContinueButton,
  });
}

class Decorations {
  final BoxDecoration? questionnaireInput;

  Decorations({
    this.questionnaireInput,
  });
}

class SizedBoxes {
  SizedBox defaultSizedBox;

  SizedBoxes(
      {required this.defaultSizedBox,});
}

class Borders {
  Border graphBorder;

  Borders({required this.graphBorder});
}
