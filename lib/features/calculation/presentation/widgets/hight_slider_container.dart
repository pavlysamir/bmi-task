import 'package:bmi_task/constants.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:bmi_task/features/calculation/presentation/manager/calculator_cubit/cubit/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightSliderContainer extends StatelessWidget {
  const HeightSliderContainer({
    super.key,
    // required this.height,
    // required this.heightText,
    // required this.onChanged
  });

  // final double height;
  // final String heightText;
  // final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorCubit, CalculatorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 150.h,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                //spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                'Height',
                style: Styles.textStyle16Orange,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${CalculatorCubit.get(context)!.height.round()}',
                      style: Styles.textStyle24BoldBlack,
                    ),
                    Text(
                      'cm',
                      style: Styles.textStyle16Black,
                    )
                  ]),
              Slider(
                activeColor: kPrimaryKey,
                value: CalculatorCubit.get(context)!.height,
                onChanged: (value) {
                  CalculatorCubit.get(context)!.changeHeight(value);
                },
                max: 220,
                min: 80,
              )
            ],
          ),
        );
      },
    );
  }
}
