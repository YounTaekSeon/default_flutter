import 'package:flutter/material.dart';
import 'package:youneciohc/widgets/screens/buttons_screen.dart';
import 'package:youneciohc/widgets/screens/creates_screen.dart';
import 'package:youneciohc/widgets/screens/layouts_screen.dart';
import 'package:youneciohc/widgets/screens/gesture_screen.dart';
import 'package:youneciohc/widgets/screens/list_screen.dart';

enum SkillStacks {
  LAYOUTS("레이아웃", LayoutsScreen()),
  BUTTONS("버튼", ButtonsScreen()),
  ROTATES("제스처", GestureScreen()),
  CREATES("생성",CreatesScreen()),
  List("리스트(정렬)",ListScreen()),
  ;

  const SkillStacks(this.name, this.widget);

  final String name;
  final Widget widget;
}