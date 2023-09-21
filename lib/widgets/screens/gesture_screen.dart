import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:youneciohc/utils/app_util.dart';
import 'package:youneciohc/widgets/commons/deafult_body.dart';
import 'package:youneciohc/widgets/commons/ink_wrapper.dart';

class GestureScreen extends StatefulWidget {
  const GestureScreen({Key? key}) : super(key: key);

  @override
  State<GestureScreen> createState() => _GestureScreenState();
}

class _GestureScreenState extends State<GestureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _Body(),
    );
  }
}

// class GestureScreen extends StatelessWidget {
//   const GestureScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: _Body(),
//     );
//   }
// }

class _Body extends DefaultBody {
  @override
  Widget buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(height: double.infinity,),
        GestureIcon(),
        Container(
          height: 50,
          width: 50,
          color: Colors.green,
        ),
      ],
    );
  }
}

class GestureIcon extends StatefulWidget {
  const GestureIcon({Key? key}) : super(key: key);

  @override
  State<GestureIcon> createState() => _GestureIconState();
}

class _GestureIconState extends State<GestureIcon> {
  Color _iConColor = Colors.black;
  double _leftValue = 0;
  double _topValue = 0;

  int _time = 3000;

  // double _baseScaleFactor = 120;
  // double _scaleFactor = 120;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: _time),
      left: _leftValue,
      top: _topValue,
      child: GestureDetector(
        onTap: () => setState(() {
          _topValue = 0;
          _leftValue = 0;
          _tapIcon();
          AppUtil.printHighlightLog("Tap $_topValue $_leftValue");
        }),
        onLongPress: () => setState(() {
          _longPressIcon();
        }),
        onPanStart: (details) {
          setState(() {
            _topValue = details.localPosition.dy;
            _leftValue = details.localPosition.dx;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _topValue += details.delta.dy;
            _leftValue += details.delta.dx;
            _time = 500;
          });
        },
        onPanEnd: (details) {
          setState(() {
            _topValue = 0;
            _leftValue = 0;
          });
        },
        // onScaleStart: (details) {
        //   _baseScaleFactor = _scaleFactor;
        // },
        // onScaleUpdate: (details) {
        //   setState(() {
        //     _scaleFactor = _baseScaleFactor * details.scale;
        //   });
        // },
        child: Icon(
          Icons.check_circle_outline,
          size: 100,
          color: _iConColor,
        ),
      ),
    );
  }

  void _tapIcon() {
    _changeColor();
    showMessage("Tap");
  }

  void _longPressIcon() {
    ("Long Press");
  }

  void _changeColor() {
    _iConColor == Colors.black
        ? _iConColor = Colors.green
        : _iConColor = Colors.black;
  }
}

void showMessage(String message) {
  Fluttertoast.showToast(msg: message);
}
