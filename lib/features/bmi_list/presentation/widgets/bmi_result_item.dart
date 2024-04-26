import 'package:bmi_task/constants.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:bmi_task/core/widgets/pop_up_dialog.dart';
import 'package:bmi_task/features/calculation/data/models/bmi_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BmiResultItem extends StatelessWidget {
  const BmiResultItem(
      {super.key, required this.bmiResultsModel, required this.function});

  final BmiResultsModel bmiResultsModel;
  final Function() function;

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
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Bmi Resuls  ',
                        style: Styles.textStyle16Black,
                      ),
                      const Spacer(),
                      IconButton(
                          iconSize: 25.h,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => PopUpDialog(
                                context: context,
                                function: function,
                                title: 'Confirm delete Result',
                                subTitle:
                                    'if you confirm to delete this Result will not be a backup',
                                colorButton1: kPoppingsRedColor,
                                colorButton2: Colors.red,
                                textColortcolor1: Colors.red,
                                textColortcolor2: Colors.white,
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  ),
                  Text(
                    "Height: ${bmiResultsModel.height}cm",
                    style: Styles.textStyle14Black,
                  ),
                  Text(
                    "weight:  ${bmiResultsModel.weight}km",
                    style: Styles.textStyle14Black,
                  ),
                  Text(
                    "age:  ${bmiResultsModel.age}",
                    style: Styles.textStyle14Black,
                  )
                ])));
  }
}
