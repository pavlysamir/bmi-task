import 'package:bmi_task/core/errors/failure.dart';
import 'package:bmi_task/core/utils/service_locator.dart';
import 'package:bmi_task/core/utils/shared_preferences_cash_helper.dart';
import 'package:bmi_task/features/calculation/data/models/bmi_results.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRepo {
  Future<Either<Failuer, void>> saveBmiData(
    String dateTime,
    double height,
    double weight,
    double age,
  ) async {
    try {
      BmiResultsModel bmiResultsModel = BmiResultsModel(
        dateTime: dateTime,
        height: height,
        weight: weight,
        age: age,
      );
      var saveBmiData = await FirebaseFirestore.instance
          .collection('users')
          .doc(getIt.get<CashHelperSharedPreferences>().getData(key: 'uId'))
          .collection("bmiResults")
          .add(bmiResultsModel.toMap());

      // Fetch the updated list of posts

      return right(saveBmiData);
    } catch (e) {
      return left(FirebaseError(e.toString()));
    }
  }

  Future<Either<Failuer, void>> signOut() async {
    try {
      // Remove the token associated with the current user from Firebase collection
      String? currentUserId = FirebaseAuth.instance.currentUser?.uid;
      if (currentUserId != null) {
        // Sign out the current user
        await FirebaseAuth.instance.signOut();
      }

      // Remove user data from SharedPreferences
      getIt.get<CashHelperSharedPreferences>().removeData(key: 'uId');
      getIt.get<CashHelperSharedPreferences>().removeData(key: 'userName');

      return const Right(null);
    } catch (e) {
      return Left(FirebaseError(e.toString()));
    }
  }
}
