import 'package:bmi_task/constants.dart';
import 'package:bmi_task/core/widgets/Custom_AppBar_with_title.dart';
import 'package:bmi_task/features/bmi_list/presentation/manager/results_cubit/cubit/results_cubit.dart';
import 'package:bmi_task/features/bmi_list/presentation/widgets/bmi_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiListView extends StatefulWidget {
  const BmiListView({super.key});

  @override
  State<BmiListView> createState() => _BmiListViewState();
}

class _BmiListViewState extends State<BmiListView> {
  ScrollController? _scrollController;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);
    ResultsCubit.get(context)?.getResultsBmi();
  }

  @override
  void dispose() {
    _scrollController!.removeListener(_scrollListener);

    _scrollController!.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    // Check if the user has reached the end of the list
    if (_scrollController!.position.pixels >=
        0.9 * _scrollController!.position.maxScrollExtent) {
      // Load more posts when the user reaches the end

      if (!isLoading) {
        isLoading = true;
        await ResultsCubit.get(context)?.loadMorePosts();
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultsCubit, ResultsState>(
      builder: (context, state) {
        return Scaffold(
            appBar: const CustomAppbareWithTitle(title: 'Bmi List Results'),
            body: state is GetResultsBmiLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: kPrimaryKey,
                  ))
                : ResultsCubit.get(context)!.bmiResultsList.isEmpty
                    ? const Center(
                        child: Text('No Results Found'),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount:
                            ResultsCubit.get(context)!.bmiResultsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: BmiResultItem(
                              function: () {
                                ResultsCubit.get(context)!
                                    .deleteResult(ResultsCubit.get(context)!
                                        .docsIds[index])
                                    .then((value) {
                                  ResultsCubit.get(context)?.getResultsBmi();
                                });
                                Navigator.pop(context);
                              },
                              bmiResultsModel: ResultsCubit.get(context)!
                                  .bmiResultsList[index],
                            ),
                          );
                        }));
      },
    );
  }
}
