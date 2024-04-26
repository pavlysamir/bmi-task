import 'package:bmi_task/core/utils/styles.dart';
import 'package:bmi_task/features/authentacation/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgeWeightContainer extends StatelessWidget {
  const AgeWeightContainer(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              hintText,
              style: Styles.textStyle16Orange,
            ),
            SizedBox(
              width: 90.w,
              child: CustomFormField(
                  controller: controller,
                  validationMassage: (value) {
                    if (value.isEmpty) {
                      return "Please Enter Your $hintText";
                    }
                  },
                  hintText: hintText,
                  textInputType: TextInputType.number),
            )
          ],
        ),
      ),
    );
  }
}
