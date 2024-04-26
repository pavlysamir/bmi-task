part of 'calculator_cubit.dart';

@immutable
sealed class CalculatorState {}

final class CalculatorInitial extends CalculatorState {}

final class ChangeHeightState extends CalculatorState {}

final class CalculateBmiState extends CalculatorState {}
