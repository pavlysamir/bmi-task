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
