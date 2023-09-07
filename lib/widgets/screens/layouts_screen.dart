import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youneciohc/dialog/dialog_helper.dart';
import 'package:youneciohc/widgets/commons/deafult_body.dart';

class LayoutsScreen extends StatelessWidget {
  const LayoutsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("레이아웃"),
      ),
      body: _Body(),
    );
  }
}

class _Body extends DefaultBody {
  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            primary: false,
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 20,
                childAspectRatio: 5 / 4),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                splashColor: Colors.black,
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Center(child: Text("$index")),
                ),
              );
            },
          ),
          SizedBox(
            height: 200,
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              scrollDirection: Axis.horizontal,
              primary: false,
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 5 / 4,
                  mainAxisSpacing: 20),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  splashColor: Colors.black,
                  onTap: () {},
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.black, width: 3)),
                    child: Center(child: Text("$index")),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            primary: false,
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                splashColor: Colors.black,
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Center(child: Text("$index")),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
