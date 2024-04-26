import 'package:bmi_task/constants.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:bmi_task/core/widgets/pop_up_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.function});
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => PopUpDialog(
              context: context,
              function: function,
              title: 'Sign Out',
              subTitle: 'Are you Sure you want to Sign Out from your account?',
              colorButton1: kPoppingsRedColor,
              colorButton2: Colors.red,
              textColortcolor1: Colors.red,
              textColortcolor2: Colors.white,
            ),
          );
        },
        child: Container(
            decoration: BoxDecoration(
              color: kPrimaryKey.withAlpha(100),
              borderRadius: BorderRadius.circular(10),
            ),
            width: 90.w,
            height: 30.h,
            child: Text(
              'Sign Up',
              style: Styles.textStyle16Black,
              textAlign: TextAlign.center,
            )));
  }
}
