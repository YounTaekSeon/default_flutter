
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Marginable<T extends Widget> extends Container {
  EdgeInsetsGeometry? margin;

  Marginable(T widget, {this.margin, double? height, double? width}) : super(
      child: widget,
      margin: margin,
      height: height,
      width: width
  );

  factory Marginable.symmetric(T widget, {double horizontal = 0, double vertical = 0}) {
    return Marginable(widget, margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical));
  }

  factory Marginable.all(T widget, {double value = 0}) {
    return Marginable(widget, margin: EdgeInsets.all(value));
  }

  factory Marginable.ltrb(T widget, {double left=0, double top=0, double right=0, double bottom=0, double? height, double? width}) {
    return Marginable(widget, margin: EdgeInsets.fromLTRB(left, top, right, bottom), height: height, width: width,);
  }
}