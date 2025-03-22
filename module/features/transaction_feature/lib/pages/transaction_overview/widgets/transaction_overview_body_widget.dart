import 'package:flutter/material.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_widget/empty_body/empty_body_widget.dart';
import 'package:transaction_feature/bloc/transaction_watcher/transaction_watcher_bloc.dart';
import 'package:transaction_feature/pages/transaction_overview/widgets/transaction_overview_card_widget.dart';

class TransactionOverviewBodyWidget extends StatelessWidget {
  const TransactionOverviewBodyWidget({
    required this.controller,
    required this.hasReachedMax,
    super.key,
  });

  final ScrollController controller;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionWatcherBloc, TransactionWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (state) {
            if (state.transactionList.isNotEmpty) {
              return ListView.builder(
                controller: controller,
                itemCount: hasReachedMax
                    ? state.transactionList.length
                    : state.transactionList.length + 1,
                padding: const EdgeInsets.all(MARGIN),
                itemBuilder: (context, index) {
                  if (index == state.transactionList.length &&
                      hasReachedMax != true) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  final data = state.transactionList[index];
                  return TransactionOverviewCardWidget(data: data);
                },
              );
            } else {
              return const EmptyBodyWidget(
                type: EmptyBodyType.transaction,
              );
            }
          },
        );
      },
    );
  }
}
