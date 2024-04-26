import 'package:bmi_task/core/Theme/Teme_data.dart';
import 'package:bmi_task/core/utils/app_router.dart';
import 'package:bmi_task/features/bmi_list/presentation/manager/results_cubit/cubit/results_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ResultsCubit()..getResultsBmi()),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
