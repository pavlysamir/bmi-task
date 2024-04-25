import 'package:bmi_task/constants.dart';
import 'package:bmi_task/core/utils/app_router.dart';
import 'package:bmi_task/core/utils/service_locator.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:bmi_task/core/widgets/custom_button_large.dart';
import 'package:bmi_task/core/widgets/custom_go_navigator.dart';
import 'package:bmi_task/features/authentacation/data/auth_repo/auth_repo.dart';
import 'package:bmi_task/features/authentacation/presentation/manager/auth_cubit/cubit/auth_cubit.dart';
import 'package:bmi_task/features/authentacation/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        authRepo: getIt.get<AuthRepo>(),
      ),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterCreateUserSuccessState) {
            customGoAndDeleteNavigate(
                context: context, path: AppRouter.kHomeView);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: AuthCubit.get(context)!.formKey,
              child: Padding(
                padding: EdgeInsets.all(30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' Login',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: kPrimaryKey),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text('Welcom to BMI Calculator',
                        style: Styles.textStyle14Grey),
                    SizedBox(height: 30.h),
                    Text(
                      'Enter Your Name',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomFormField(
                        prefixIcon: const Icon(
                          Icons.account_circle_rounded,
                          color: kPrimaryKey,
                        ),
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Name',
                        controller: AuthCubit.get(context)!.nameController,
                        validationMassage: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Your Name";
                          }
                        }),
                    SizedBox(
                      height: 30.h,
                    ),
                    state is RegisterCreateUserLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryKey,
                            ),
                          )
                        : CustomButtonLarge(
                            text: 'Login',
                            color: kPrimaryKey,
                            textColor: Colors.white,
                            function: () {
                              if (AuthCubit.get(context)!
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                AuthCubit.get(context)!.userRegister(
                                  name: AuthCubit.get(context)!
                                      .nameController
                                      .text,
                                );
                              }
                            }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
