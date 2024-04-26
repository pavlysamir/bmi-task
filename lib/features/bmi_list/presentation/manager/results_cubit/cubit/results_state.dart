part of 'results_cubit.dart';

@immutable
sealed class ResultsState {}

final class ResultsInitial extends ResultsState {}

final class GetResultsBmiSuccess extends ResultsState {}

final class GetResultsBmiLoading extends ResultsState {}

final class GetResultsBmiError extends ResultsState {}

class GetNewResultsSuccess extends ResultsState {}

class GetNewResultsLoading extends ResultsState {}

class DeleteMyResultSuccessfully extends ResultsState {}

class DeleteMyResultLoading extends ResultsState {}

class DeleteMyResultError extends ResultsState {
  final String error;
  DeleteMyResultError(this.error);
}
