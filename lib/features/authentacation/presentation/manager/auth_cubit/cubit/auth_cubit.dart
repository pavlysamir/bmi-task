import 'package:bloc/bloc.dart';
import 'package:bmi_task/features/authentacation/data/auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRepo,
  }) : super(AuthInitial());

  AuthRepo authRepo;

  static AuthCubit? get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> userRegister({
    required String name,
  }) async {
    emit(RegisterCreateUserLoadingState());
    var register = await authRepo.registerNewUser(
      name: name,
    );
    register.fold((failure) {
      print(failure.messege.toString());
      emit(RegisterCreateUserErrorState(failure.messege));
    }, (r) {
      emit(RegisterCreateUserSuccessState());
    });
  }
}
