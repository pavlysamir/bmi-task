import 'package:bloc/bloc.dart';
import 'package:bmi_task/core/utils/service_locator.dart';
import 'package:bmi_task/core/utils/shared_preferences_cash_helper.dart';
import 'package:bmi_task/features/calculation/data/models/bmi_results.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'results_state.dart';

class ResultsCubit extends Cubit<ResultsState> {
  ResultsCubit() : super(ResultsInitial());
  static ResultsCubit? get(context) => BlocProvider.of(context);

  int resultLimit = 10;
  List<BmiResultsModel> bmiResultsList = [];
  List<String> docsIds = [];

  // Define a variable to keep track of the last document snapshot
  DocumentSnapshot<Map<String, dynamic>>? lastDocumentSnapshot;
  Future<void> getResultsBmi() async {
    try {
      emit(GetResultsBmiLoading());
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(getIt.get<CashHelperSharedPreferences>().getData(key: 'uId'))
          .collection("bmiResults")
          .orderBy('dateTime', descending: true)
          .limit(resultLimit)
          .get();
      bmiResultsList.clear();
      docsIds.clear();

      for (var element in snapshot.docs) {
        bmiResultsList.add(BmiResultsModel.fromJson(element.data()));
        docsIds.add(element.id);
      }
      lastDocumentSnapshot =
          (snapshot.docs.isNotEmpty ? snapshot.docs.last : null);

      emit(GetResultsBmiSuccess());
    } catch (e) {
      emit(GetResultsBmiError());
    }
  }

  Future<void> loadMorePosts() async {
    try {
      // Check if there is a last document snapshot available
      if (lastDocumentSnapshot != null) {
        // Call getPosts again to fetch the next page of posts
        await getNexpost();
      }
    } catch (error) {
      // Handle any errors
      // emit(LoadMorePostsError(error: error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> getNexpost() async {
    emit(GetNewResultsLoading());

    try {
      // Initialize a query for posts ordered by dateTime
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(getIt.get<CashHelperSharedPreferences>().getData(key: 'uId'))
          .collection("bmiResults")
          .orderBy('dateTime', descending: true)
          .limit(resultLimit)
          .startAfterDocument(lastDocumentSnapshot!)
          .get();
      // Loop through documents to handle each post
      for (var element in snapshot.docs) {
        // Parse post data
        bmiResultsList.add(BmiResultsModel.fromJson(element.data()));

        // Handle the post based on its type
      }

      // Update the last document snapshot for pagination
      lastDocumentSnapshot =
          (snapshot.docs.isNotEmpty ? snapshot.docs.last : null);

      // Emit success state after updating the lists
      emit(GetNewResultsSuccess());
      // Apply pagination limit
    } catch (error) {
      // Handle any errors
      //emit(GetPostsError(error: error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  Future<void> deleteResult(String resultsId) async {
    try {
      emit(DeleteMyResultLoading());
      FirebaseFirestore.instance
          .collection('users')
          .doc(getIt.get<CashHelperSharedPreferences>().getData(key: 'uId'))
          .collection("bmiResults")
          .doc(resultsId)
          .delete();
      emit(DeleteMyResultSuccessfully());
    } catch (e) {
      emit(DeleteMyResultError(e.toString()));
    }
  }
}
