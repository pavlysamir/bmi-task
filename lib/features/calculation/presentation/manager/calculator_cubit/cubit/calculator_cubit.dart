import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bmi_task/features/calculation/data/home_repo/home_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit({
    required this.homeRepo,
  }) : super(CalculatorInitial());

  HomeRepo homeRepo;
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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

  Future<void> saveBmiData() async {
    emit(SaveBmiDataLaodingState());
    double weight = double.parse(weightController.text);
    double age = double.parse(ageController.text);

    var saveBmiData = await homeRepo.saveBmiData(
      DateTime.now().toString(),
      height,
      weight,
      age,
    );
    saveBmiData.fold((failure) {
      emit(SaveBmiDataErrorState(failure.messege));
    }, (r) {
      emit(SaveBmiDataSuccessState());
    });
  }

  Future<void> signOut() async {
    emit(HomeSignOutUserLoading());
    var signOut = await homeRepo.signOut();
    signOut.fold((failure) {
      emit(HomeSignOutUserError(failure.messege));
      if (kDebugMode) {
        print(failure.messege);
      }
    }, (right) {
      emit(HomeSignOutUserSuccess());
    });
  }
}
