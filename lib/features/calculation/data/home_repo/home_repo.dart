import 'package:bmi_task/core/errors/failure.dart';
import 'package:bmi_task/core/utils/service_locator.dart';
import 'package:bmi_task/core/utils/shared_preferences_cash_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  Future<Either<Failuer, void>> saveBmiData(
    String dateTime,
    double height,
    double weight,
    double age,
  ) async {
    try {
      var saveBmiData = await FirebaseFirestore.instance
          .collection('users')
          .doc(getIt.get<CashHelperSharedPreferences>().getData(key: 'uId'))
          .set({
        'bmiData': [
          {'dateTime': dateTime, "height": height, "weight": weight, "age": age}
        ]
      });

      // Fetch the updated list of posts

      return right(saveBmiData);
    } catch (e) {
      return left(FirebaseError(e.toString()));
    }
  }
}
