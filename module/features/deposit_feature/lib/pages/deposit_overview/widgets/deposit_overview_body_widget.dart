import 'package:deposit_feature/bloc/deposit_watcher/deposit_watcher_bloc.dart';
import 'package:deposit_feature/pages/deposit_overview/widgets/deposit_overview_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_widget/empty_body/empty_body_widget.dart';

class DepositOverviewBodyWidget extends StatelessWidget {
  const DepositOverviewBodyWidget({
    required this.controller,
    required this.hasReachedMax,
    super.key,
  });

  final ScrollController controller;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositWatcherBloc, DepositWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (state) {
            if (state.depositList.isNotEmpty) {
              return ListView.builder(
                controller: controller,
                itemCount: hasReachedMax
                    ? state.depositList.length
                    : state.depositList.length + 1,
                padding: const EdgeInsets.all(MARGIN),
                itemBuilder: (context, index) {
                  if (index == state.depositList.length &&
                      hasReachedMax != true) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  final data = state.depositList[index];

                  return DepositOverviewCard(data: data);
                },
              );
            }
            return const EmptyBodyWidget(
              type: EmptyBodyType.notification,
            );
          },
        );
      },
    );
  }
}
