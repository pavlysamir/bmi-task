part of 'calculator_cubit.dart';

@immutable
sealed class CalculatorState {}

final class CalculatorInitial extends CalculatorState {}

final class ChangeHeightState extends CalculatorState {}

final class CalculateBmiState extends CalculatorState {}

final class SaveBmiDataLaodingState extends CalculatorState {}

final class SaveBmiDataSuccessState extends CalculatorState {}

final class SaveBmiDataErrorState extends CalculatorState {
  late final String? error;

  SaveBmiDataErrorState(this.error);
}

final class HomeSignOutUserLoading extends CalculatorState {}

final class HomeSignOutUserSuccess extends CalculatorState {}

final class HomeSignOutUserError extends CalculatorState {
  late final String? error;

  HomeSignOutUserError(this.error);
}

final class HomegetUserNameLoading extends CalculatorState {}

final class HomegetUserNameSuccess extends CalculatorState {
  final String? name;
  HomegetUserNameSuccess(this.name);
}

final class HomegetUserNameError extends CalculatorState {
  late final String? error;
  HomegetUserNameError(this.error);
}
