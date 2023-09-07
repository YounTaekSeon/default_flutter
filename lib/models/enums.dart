import 'package:flutter/material.dart';
import 'package:youneciohc/widgets/screens/buttons_screen.dart';
import 'package:youneciohc/widgets/screens/creates_screen.dart';
import 'package:youneciohc/widgets/screens/drags_screen.dart';
import 'package:youneciohc/widgets/screens/layouts_screen.dart';
import 'package:youneciohc/widgets/screens/rotates_screen.dart';

enum SkillStacks {
  LAYOUTS("레이아웃", LayoutsScreen()),
  BUTTONS("버튼", ButtonsScreen()),
  ROTATES("회전", RotatesScreen()),
  DRAGS("드래그",DragsScreen()),
  CREATES("생성",CreatesScreen()),
  ;

  const SkillStacks(this.name, this.widget);

  final String name;
  final Widget widget;
}