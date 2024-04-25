import 'package:bmi_task/core/errors/failure.dart';
import 'package:bmi_task/core/utils/service_locator.dart';
import 'package:bmi_task/core/utils/shared_preferences_cash_helper.dart';
import 'package:bmi_task/features/authentacation/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  Future<void> createNewUser({
    required String name,
    required String uId,
  }) async {
    UserModel userModel = UserModel(
      name: name,
      uId: uId,
    );
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(uId).set(userModel.toMap());
  }

  Future<Either<Failuer, void>> registerNewUser({
    required String name,
  }) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInAnonymously();
      var registerUser = createNewUser(name: name, uId: credential.user!.uid);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: 'uId', value: credential.user!.uid);
      return right(registerUser);
    } catch (e) {
      return left(FirebaseError.fromException(e));
    }
  }
}
