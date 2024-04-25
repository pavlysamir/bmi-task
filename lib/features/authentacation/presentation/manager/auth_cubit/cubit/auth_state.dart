part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class RegisterCreateUserLoadingState extends AuthState {}

class RegisterCreateUserSuccessState extends AuthState {
//  late final String uId;
//   RegisterCreateUserSuccessState(this.uId);
}

class RegisterCreateUserErrorState extends AuthState {
  late final String? error;

  RegisterCreateUserErrorState(this.error);
}
