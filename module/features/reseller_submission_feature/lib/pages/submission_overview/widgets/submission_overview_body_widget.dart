import 'package:flutter/material.dart';
import 'package:reseller_submission_feature/bloc/submission_watcher/submission_watcher_bloc.dart';
import 'package:reseller_submission_feature/pages/submission_overview/widgets/submission_card_widget.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_widget/empty_body/empty_body_widget.dart';

class SubmissionOverviewBodyWidget extends StatelessWidget {
  const SubmissionOverviewBodyWidget({
    required this.controller,
    required this.hasReachedMax,
    super.key,
  });

  final ScrollController controller;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmissionWatcherBloc, SubmissionWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (state) {
            if (state.submissionList.isNotEmpty) {
              return ListView.builder(
                controller: controller,
                itemCount: hasReachedMax
                    ? state.submissionList.length
                    : state.submissionList.length + 1,
                padding: const EdgeInsets.all(MARGIN),
                itemBuilder: (context, index) {
                  if (index == state.submissionList.length &&
                      hasReachedMax != true) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  final data = state.submissionList[index];

                  return SubmissionCardWidget(
                    data: data,
                  );
                },
              );
            }
            return const EmptyBodyWidget(
              type: EmptyBodyType.submission,
            );
          },
        );
      },
    );
  }
}
