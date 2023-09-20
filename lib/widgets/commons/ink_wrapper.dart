import 'package:flutter/material.dart';

class InkWrapper extends StatelessWidget {
  final Color? splashColor;
  final Widget child;
  final VoidCallback? onTap;

  InkWrapper(this.child, {
    this.splashColor,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color color = splashColor ?? Colors.lightBlueAccent;

    return Stack(
      children: <Widget>[
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: color,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}