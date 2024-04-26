import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitial());
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double height = 120;
  var bmiResult = 0.0;

  void changeHeight(double value) {
    height = value;
    emit(ChangeHeightState());
  }

  void calculateBmi() {
    double weight = double.parse(weightController.text);
    bmiResult = weight / pow(height / 100, 2);
    emit(CalculateBmiState());
  }

  static CalculatorCubit? get(context) => BlocProvider.of(context);
  double progressValue = 0;

  void normalize({double min = 0, double max = 100}) {
    // Ensure the value is within the range
    bmiResult = bmiResult.clamp(min, max);

    // Normalize the value to a range of 0 to 1
    progressValue = (bmiResult - min) / (max - min);
  }
}
