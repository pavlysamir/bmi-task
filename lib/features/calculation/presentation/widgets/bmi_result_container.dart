import 'package:bmi_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BmiResultContainer extends StatelessWidget {
  const BmiResultContainer({super.key, required this.bmiResult});

  final double bmiResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      //height: 150.h,
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
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Bmi Resuls  ',
                style: Styles.textStyle16Orange,
              ),
              Text(
                '${bmiResult.round()} ',
                style: Styles.textStyle24BoldBlack,
              ),
            ],
          )),
    );
  }
}
