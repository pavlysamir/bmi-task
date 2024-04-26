import 'package:bmi_task/constants.dart';
import 'package:bmi_task/core/utils/service_locator.dart';
import 'package:bmi_task/core/widgets/Custom_AppBar_with_title.dart';
import 'package:bmi_task/core/widgets/custom_button_large.dart';
import 'package:bmi_task/features/calculation/data/home_repo/home_repo.dart';
import 'package:bmi_task/features/calculation/presentation/manager/calculator_cubit/cubit/calculator_cubit.dart';
import 'package:bmi_task/features/calculation/presentation/widgets/age_weight_container.dart';
import 'package:bmi_task/features/calculation/presentation/widgets/bmi_result_container.dart';
import 'package:bmi_task/features/calculation/presentation/widgets/hight_slider_container.dart';
import 'package:bmi_task/features/calculation/presentation/widgets/linear_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              appBar: const CustomAppbareWithTitle(
                title: 'Calculator',
              ),
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
                                print(CalculatorCubit.get(context)!
                                    .progressValue);
                                CalculatorCubit.get(context)!.calculateBmi();
                                CalculatorCubit.get(context)!.saveBmiData();
                              }
                            }),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
