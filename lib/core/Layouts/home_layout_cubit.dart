import 'package:bmi_task/features/bmi_list/presentation/views/bmi_list.dart';
import 'package:bmi_task/features/calculation/presentation/views/Calculator_view.dart';
import 'package:bmi_task/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List screens = [
    const CalculatorView(),
    const BmiListView(),
    const ProfileView(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    emit(HomeChaneNavBar());
  }
}
