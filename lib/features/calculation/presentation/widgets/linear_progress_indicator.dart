import 'package:bmi_task/constants.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultiColorLinearProgressIndicator extends StatelessWidget {
  final double progressValue;

  const MultiColorLinearProgressIndicator({
    super.key,
    required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          // Background indicator with multiple colors
          Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Underweight',
                            style: Styles.textStyle12Black,
                          ),
                          Expanded(
                            child: Container(
                              color: kPrimaryKey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Normal',
                            style: Styles.textStyle12Black,
                          ),
                          Expanded(
                            child: Container(
                              color: kGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'OverWeight',
                            style: Styles.textStyle12Black,
                          ),
                          Expanded(
                            child: Container(
                              color: kSecondaryKey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Obesity',
                            style: Styles.textStyle12Black,
                          ),
                          Expanded(
                            child: Container(
                              color: kPoppingsRedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned.fill(
            child: LinearProgressIndicator(
              value: progressValue,
              backgroundColor:
                  Colors.transparent, // Make background transparent
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.transparent), // Make progress bar transparent
            ),
          ),

          // Custom arrow indicator
          Positioned(
            left: calculateArrowPosition(progressValue, context),
            bottom: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
                size: 50.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Calculate the position of the arrow based on the progress value
  double calculateArrowPosition(double progress, BuildContext context) {
    // Calculate the width of the container
    double containerWidth = MediaQuery.of(context).size.width;

    // Calculate the position of the arrow based on the progress value
    return containerWidth * progress -
        25.w; // 12 is the half width of the arrow icon
  }
}
