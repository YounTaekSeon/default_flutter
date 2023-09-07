
import 'package:flutter/material.dart';



import 'package:flutter/material.dart';
import 'package:youneciohc/utils/app_util.dart';

abstract class DefaultBody extends StatefulWidget {
  late BuildContext buildContext;
  bool isValidContext = false;

  DefaultBody({Key? key}) : super();

  @override
  State<StatefulWidget> createState() => _DefaultBodyState();

  Widget buildBody(BuildContext context);

  void onStart(Duration timeStamp) {
    // nothing to do
  }

  void onDispose() {

  }
}

class _DefaultBodyState extends State<DefaultBody> {
  @override
  Widget build(BuildContext context) {
    AppUtil.printHighlightLog("Build DefaultBody");

    widget.buildContext = context;
    widget.isValidContext = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onStart(timeStamp);
    });

    return widget.buildBody(context);
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void dispose() {
    widget.onDispose();
    widget.isValidContext = false;
    super.dispose();
  }
}

// abstract class DefaultBody extends StatelessWidget {
//   late BuildContext buildContext;
//
//   DefaultBody({ super.key });
//
//   @override
//   Widget build(BuildContext context) {
//     buildContext = context;
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       onStart(timeStamp);
//     });
//
//     return buildBody(context);
//   }
//
//   Widget buildBody(BuildContext context);
//
//   void onStart() {
//     // nothing to do
//   }
// }



// abstract class DefaultBody extends StatelessWidget {
//   late BuildContext buildContext;
//
//   DefaultBody({ super.key });
//
//   @override
//   Widget build(BuildContext context) {
//     buildContext = context;
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       onStart(timeStamp);
//     });
//
//     return buildBody(context);
//   }
//
//   Widget buildBody(BuildContext context);
//
//   void onStart(Duration timeStamp) {
//     // nothing to do
//   }
// }
