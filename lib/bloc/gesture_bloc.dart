import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youneciohc/utils/app_util.dart';

class GestureBloc extends Cubit<GestureState> {

  GestureBloc() : super(GestureState(false, 0.0));

  void gestureZoom(ScaleUpdateDetails details) {
    double scale = details.scale;
      emit(GestureState(false, scale));
  }
  void gestureTap(double scaleFactor) {
    emit(GestureState(true, scaleFactor));
  }
}

class GestureState {
  bool tap;
  double scale;
  GestureState(this.tap, this.scale);
}