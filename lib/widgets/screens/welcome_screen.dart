import 'package:flutter/material.dart';
import 'package:youneciohc/models/enums.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Skill Stack"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_ShortCutMenu()],
        ),
      ),
    );
  }
}

class _ShortCutMenu extends StatelessWidget {
  static const int COLUMN_COUNT = 2;
  final List<SkillStacks> skillStacks = SkillStacks.values;

  _ShortCutMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: skillStacks.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: COLUMN_COUNT),
        itemBuilder: (BuildContext context, int index) {
          SkillStacks skillStack = skillStacks[index];
          return InkWell(
            splashColor: Colors.blue,
            onTap: () {
              Navigator.of(context).push((MaterialPageRoute(builder: (context) => skillStack.widget)));
            },
            child: Center(child: Text(skillStack.name, style: TextStyle(color: Colors.black, fontSize: 20),)),
          );
        });
  }
}
