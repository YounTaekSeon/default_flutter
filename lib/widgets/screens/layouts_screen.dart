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
      drawer: const Drawer(child: _ListView()),
      appBar: AppBar(
        title: const Text("레이아웃"),
      ),
      body: _Body(),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const DrawerHeader(
                child: Text("Drawer"),
              ),
              InkWell(
                splashColor: Colors.black,
                onTap: () {},
                child: const Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                    child: ListTile(title: AutoSizeText(("First Button")))),
              ),
              InkWell(
                splashColor: Colors.black,
                onTap: () {},
                child: const Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                    child: ListTile(title: AutoSizeText(("Second Button")))),
              ),
              InkWell(
                splashColor: Colors.black,
                onTap: () {},
                child: const Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                    child: ListTile(title: AutoSizeText(("Third Button")))),
              ),
            ],
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          // This container holds all the children that will be aligned
          // on the bottom and should not scroll with the above ListView
          child: Column(
            children: [
              const Divider(),
              InkWell(
                splashColor: Colors.black,
                onTap: () {},
                child: const ListTile(
                    leading: Icon(Icons.settings), title: Text('Settings')),
              ),
              InkWell(
                splashColor: Colors.black,
                onTap: () {},
                child: const ListTile(
                    leading: Icon(Icons.help),
                    title: AutoSizeText('Help and Feedback', maxLines: 1)),
              )
            ],
          ),
        )
      ],
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
          TextButton(onPressed: (){_showActionSheet(context);}, child: Text("Cupertino Button")),
          TextButton(onPressed: (){_showModalSheet(context);}, child: Text("Modal Button")),
        ],
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) =>
          CupertinoActionSheet(
            title: const Text('Title'),
            message: const Text('Message'),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Default Action'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Action'),
              ),
              CupertinoActionSheetAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Destructive Action'),
              ),
            ],
          ),
    );
  }

  void _showModalSheet(BuildContext context) {
    DialogHelper.showCommonMessageDialog(buildContext,msg: "Dialog", showCancel: false, onConfirmClicked: () {
      SystemNavigator.pop();
    });
  }
}
