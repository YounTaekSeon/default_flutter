import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  bool toggleValue = false;
  int value = 0;
  int? nullableValue;
  bool positive = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    const green = Color(0xFF45CC0D);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("기본 스위치", style: TextStyle(fontSize: 20),),
            ),
            Switch(
              value: toggleValue,
              onChanged: (value) {
                setState(() {
                  toggleValue = value;
                });
              },
            ),
            CupertinoSwitch(
                value: toggleValue,
                onChanged: (bool value) {
                  setState(() {
                    toggleValue = value;
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("스위치 On Off", style: TextStyle(fontSize: 20),),
            ),
            DefaultTextStyle.merge(
              style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
              child: IconTheme.merge(
                data: IconThemeData(color: Colors.white),
                child: AnimatedToggleSwitch.dual(
                  current: positive,
                  first: false,
                  second: true,
                  spacing: 45.0,
                  animationDuration: Duration(milliseconds: 600),
                  style: ToggleStyle(
                    borderColor: Colors.transparent,
                    indicatorColor: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                  customStyleBuilder: (context, local, global) {
                    if (global.position <= 0.0) {
                      return ToggleStyle(backgroundColor: Colors.red[800]);
                    }
                    return ToggleStyle(
                        backgroundGradient: LinearGradient(
                          colors: [green, Colors.red[800]!],
                          stops: [global.position - (1 - 2 * max(0, global.position - 0.5)) * 0.7, global.position + max(0, 2 * (global.position - 0.5)) * 0.7],
                        ));
                  },
                  borderWidth: 6.0,
                  height: 60.0,
                  loadingIconBuilder: (context, global) => CupertinoActivityIndicator(color: Color.lerp(Colors.red[800], green, global.position)),
                  onChanged: (b) {
                    setState(() => positive = b);
                    // return Future<dynamic>.delayed(const Duration(seconds: 2));
                  },
                  iconBuilder: (value) => value ? Icon(Icons.power_outlined, color: green, size: 32.0) : Icon(Icons.power_settings_new_rounded, color: Colors.red[800], size: 32.0),
                  textBuilder: (value) => value ? Center(child: Text('Active')) : Center(child: Text('Inactive')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("Select", style: TextStyle(fontSize: 20),),
            ),
            AnimatedToggleSwitch.size(
              current: min(value, 2),
              style: ToggleStyle(
                backgroundColor: Color(0xFF919191),
                indicatorColor: Color(0xFFEC3345),
                borderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
                indicatorBorderRadius: BorderRadius.zero,
              ),
              values: [0, 1, 2],
              iconOpacity: 1.0,
              selectedIconScale: 1.0,
              indicatorSize: Size.fromWidth(100),
              iconAnimationType: AnimationType.onHover,
              styleAnimationType: AnimationType.onHover,
              spacing: 2.0,
              customSeparatorBuilder: (context, local, global) {
                final opacity = ((global.position - local.position).abs() - 0.5).clamp(0.0, 1.0);
                return VerticalDivider(
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Colors.white38.withOpacity(opacity));
              },
              customIconBuilder: (context, local, global) {
                final text = ['not', 'only', 'icons'][local.index];
                return Center(
                    child: Text(text, style: TextStyle(color: Color.lerp(Colors.black, Colors.white, local.animationValue))),
                );
              },
              borderWidth: 0.0,
              onChanged: (i) => setState(() => value = i),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("Nullable Rolling Switch", style: TextStyle(fontSize: 20),),
            ),
            AnimatedToggleSwitch.rolling(
              current: nullableValue,
              allowUnlistedValues: true,
              values: const [0, 1, 2, 3],
              onTap: (info) {
                if (nullableValue == info.tapped?.value) {
                  setState(() => nullableValue = null);
                }
              },
              onChanged: (i) => setState(() => nullableValue = i),
              iconBuilder: rollingIconBuilder,
              borderWidth: 4.5,
              style: const ToggleStyle(
                indicatorColor: Colors.white,
                backgroundGradient:
                LinearGradient(colors: [Colors.red, Colors.blue]),
                borderColor: Colors.transparent,
              ),
              height: 55,
              spacing: 20.0,
              loading: loading,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("Loading Switch", style: TextStyle(fontSize: 20),),
            ),
            AnimatedToggleSwitch.size(
              current: value,
              values: const [0, 1, 2, 3],
              iconOpacity: 0.2,
              indicatorSize: const Size.fromWidth(100),
              iconAnimationType: AnimationType.onHover,
              styleAnimationType: AnimationType.onHover,
              iconBuilder: (value) => Icon(
                  value.isEven ? Icons.cancel : Icons.access_time_rounded),
              style: ToggleStyle(
                borderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 2, offset: Offset(0, 1.5)),
                ],
              ),
              borderWidth: 0.0,
              styleBuilder: (i) {
                final color = colorBuilder(i);
                return ToggleStyle(
                  backgroundColor: color.withOpacity(0.3),
                  indicatorColor: color,
                );
              },
              onChanged: (i) {
                setState(() => value = i);
                return Future.delayed(const Duration(seconds: 1));
              },
            ),

            AnimatedToggleSwitch.size(
              current: positive,
              values: const [false, true],
              iconOpacity: 0.2,
              indicatorSize: const Size.fromWidth(100),
              customIconBuilder: (context, local, global) => Text(
                  local.value ? 'RAM' : 'CPU',
                  style: TextStyle(
                      color: Color.lerp(
                          Colors.black, Colors.white, local.animationValue))),
              borderWidth: 4.0,
              iconAnimationType: AnimationType.onHover,
              style: ToggleStyle(
                indicatorColor: Colors.teal,
                borderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1.5),
                  ),
                ],
              ),
              selectedIconScale: 1.0,
              onChanged: (b) => setState(() => positive = b),
            ),
            AnimatedToggleSwitch<int>.size(
              textDirection: TextDirection.rtl,
              current: value,
              values: const [0, 1, 2, 3],
              iconOpacity: 0.2,
              indicatorSize: const Size.fromWidth(100),
              customIconBuilder: (context, local, global) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${local.value}'),
                    alternativeIconBuilder(context, local, global),
                  ],
                );
              },
              style: const ToggleStyle(borderColor: Colors.transparent),
              styleBuilder: (i) => ToggleStyle(
                  indicatorColor:
                  i.isEven == true ? Colors.amber : Colors.red),
              onChanged: (i) => setState(() => value = i),
            ),
            AnimatedToggleSwitch<int>.rollingByHeight(
              height: 50.0,
              current: value,
              values: const [0, 1, 2, 3],
              onChanged: (i) => setState(() => value = i),
              iconBuilder: rollingIconBuilder,
              indicatorSize: const Size.fromWidth(2),
            ),
          ],
        ),
      ),
    );
  }

  Color colorBuilder(int value) => switch (value) {
        0 => Colors.blueAccent,
        1 => Colors.green,
        2 => Colors.orangeAccent,
        _ => Colors.red,
      };

  Widget coloredRollingIconBuilder(int value, bool foreground) {
    final color = foreground ? colorBuilder(value) : null;
    return Icon(
      iconDataByValue(value),
      color: color,
    );
  }

  Widget iconBuilder(int value) {
    return rollingIconBuilder(value, false);
  }

  Widget rollingIconBuilder(int? value, bool foreground) {
    return Icon(iconDataByValue(value));
  }

  IconData iconDataByValue(int? value) => switch (value) {
        0 => Icons.access_time_rounded,
        1 => Icons.check_circle_outline_rounded,
        2 => Icons.power_settings_new_rounded,
        _ => Icons.lightbulb_outline_rounded,
      };

  Widget sizeIconBuilder(BuildContext context,
      AnimatedToggleProperties<int> local, GlobalToggleProperties<int> global) {
    return iconBuilder(local.value);
  }

  Widget alternativeIconBuilder(BuildContext context,
      AnimatedToggleProperties<int> local, GlobalToggleProperties<int> global) {
    IconData data = Icons.access_time_rounded;
    switch (local.value) {
      case 0:
        data = Icons.ac_unit_outlined;
        break;
      case 1:
        data = Icons.account_circle_outlined;
        break;
      case 2:
        data = Icons.assistant_navigation;
        break;
      case 3:
        data = Icons.arrow_drop_down_circle_outlined;
        break;
    }
    return Icon(data);
  }
}

const tappableTextStyle = TextStyle(color: Colors.blue);

final toggleSwitchUrl = Uri.parse('https://pub.dev/packages/toggle_switch');
final liteRollingSwitchUrl =
    Uri.parse('https://pub.dev/packages/lite_rolling_switch');
final crazySwitchUrl =
    Uri.parse('https://github.com/pedromassango/crazy-switch');
