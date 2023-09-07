import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youneciohc/widgets/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black, textTheme: (TextTheme(bodyLarge: TextStyle(color: Colors.black, fontSize: 30)))),
      builder: (context, child) {
        return MediaQuery(data: MediaQuery.of(context), child: child ?? SizedBox.shrink());
      },
      home: WelcomeScreen(),
    );
  }
}
