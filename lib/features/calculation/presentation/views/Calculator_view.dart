import 'package:bmi_task/constants.dart';
import 'package:bmi_task/core/utils/app_router.dart';
import 'package:bmi_task/core/utils/service_locator.dart';
import 'package:bmi_task/core/widgets/custom_button_large.dart';
import 'package:bmi_task/core/widgets/custom_go_navigator.dart';
import 'package:bmi_task/features/calculation/presentation/manager/calculator_cubit/cubit/calculator_cubit.dart';
import 'package:bmi_task/features/calculation/presentation/widgets/age_weight_container.dart';
import 'package:bmi_task/features/calculation/presentation/widgets/bmi_result_container.dart';
import 'package:bmi_task/features/calculation/presentation/widgets/hight_slider_container.dart';
import 'package:bmi_task/features/calculation/presentation/widgets/linear_progress_indicator.dart';
import 'package:bmi_task/features/calculation/presentation/widgets/sign_up_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/home_repo/home_repo.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(
        homeRepo: getIt.get<HomeRepo>(),
      ),
      child: BlocConsumer<CalculatorCubit, CalculatorState>(
        listener: (context, state) {
          if (state is HomeSignOutUserSuccess) {
            customGoAndDeleteNavigate(
                context: context, path: AppRouter.kAuthView);
          }
        },
        builder: (context, state) {
          return Scaffold(
              bottomNavigationBar: BottomAppBar(
                  elevation: 0,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomButtonLarge(
                        text: 'Go to list of Your results',
                        color: kPrimaryKey,
                        function: () {
                          customJustGoNavigate(
                              context: context, path: AppRouter.kBmiListView);
                        },
                        textColor: Colors.white,
                      ),
                    ],
                  )),
              appBar: AppBar(
                  title: Text(
                    'BMI Calculator',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  actions: [
                    SignUpButton(
                      function: () {
                        CalculatorCubit.get(context)!.signOut();
                      },
                    )
                  ]),
              body: SingleChildScrollView(
                child: Form(
                  key: CalculatorCubit.get(context)!.formKey,
                  child: Column(
                    children: [
                      MultiColorLinearProgressIndicator(
                        progressValue:
                            CalculatorCubit.get(context)!.progressValue,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      BmiResultContainer(
                        bmiResult: CalculatorCubit.get(context)!.bmiResult,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AgeWeightContainer(
                              controller:
                                  CalculatorCubit.get(context)!.ageController,
                              hintText: 'Age',
                            ),
                            AgeWeightContainer(
                              controller: CalculatorCubit.get(context)!
                                  .weightController,
                              hintText: 'Weight',
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: HeightSliderContainer(),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: 200.w,
                          child: CustomButtonLarge(
                              text: 'Calculate',
                              color: kPrimaryKey,
                              textColor: Colors.white,
                              function: () {
                                if (CalculatorCubit.get(context)!
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  CalculatorCubit.get(context)!.normalize();
                                  if (kDebugMode) {
                                    print(CalculatorCubit.get(context)!
                                        .progressValue);
                                  }
                                  CalculatorCubit.get(context)!.calculateBmi();
                                  CalculatorCubit.get(context)!.saveBmiData();
                                }
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
