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
        Container(
          height: double.infinity,
        ),
        GestureIcon(),
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

  // int _time = 1000;

  double _baseScaleFactor = 120;
  double _scaleFactor = 120;

  @override
  Widget build(BuildContext context) {

    // return AnimatedPositioned(
    return Positioned(
      // duration: Duration(milliseconds: _time),
      left: _leftValue,
      top: _topValue,
      child: GestureDetector(
        onTap: () => setState(() {
          _tapIcon();
        }),
        onLongPress: () => setState(() {
          _deepTapIcon();
        }),
        onPanStart: (details) {
          setState(() {
            _dragStartIcon(details);
              _baseScaleFactor = _scaleFactor;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _dragIcon(details);
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
        child: Container(
          height: 200,
          width: 200,
          color: _iConColor,
        ),
      ),
    );
  }

  void _tapIcon() {
    _changeColor();
    showMessage("Tap");
  }

  void _deepTapIcon() {
    showMessage("LongTap");
  }

  void _dragIcon(DragUpdateDetails details) {
    _leftValue += details.delta.dx;
    _topValue += details.delta.dy;
    // _time = 500;
  }

  void _dragStartIcon(DragStartDetails details) {
    _leftValue = details.localPosition.dx;
    _topValue = details.localPosition.dy;
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
