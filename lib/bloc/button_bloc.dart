import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonBloc extends Cubit<bool> {

  ButtonBloc() : super(false);

  void toggleSwitch(bool status) {
    emit(!status);
  }
}