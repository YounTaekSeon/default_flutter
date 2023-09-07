import 'package:flutter/material.dart';
import 'package:youneciohc/widgets/commons/deafult_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Body();
  }
}

class _Body extends DefaultBody {

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold();
  }
}
