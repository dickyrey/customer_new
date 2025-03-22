import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reseller_submission_feature/bloc/submission_cancel_actor/submission_cancel_actor_bloc.dart';
import 'package:reseller_submission_feature/bloc/submission_detail_watcher/submission_detail_watcher_bloc.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/intl/intl.dart';
import 'package:shared_widget/alert_dialog/alert_dialog.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/empty_body/empty_body_widget.dart';

class SubmissionDetailBodyWidget extends StatelessWidget {
  const SubmissionDetailBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String status(String v) {
      switch (v) {
        case '2':
          return lang.submission_status_pending;
        case '1':
          return lang.submission_status_success;
        case '0':
          return lang.submission_status_failed;
        default:
          return lang.submission_status_pending;
      }
    }

    return BlocBuilder<SubmissionDetailWatcherBloc,
        SubmissionDetailWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const EmptyBodyWidget(
              type: EmptyBodyType.error,
            );
          },
          loading: (_) {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(MARGIN),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang.submission_details,
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: SPACE_MEDIUM),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(RADIUS),
                      border: Border.all(
                        color: theme.hintColor,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: SPACE_MEDIUM,
                      vertical: SPACE_TINY,
                    ),
                    child: Column(
                      children: [
                        _ListTile(
                          title: lang.store_name,
                          trailing: state.submission.store,
                        ),
                        _ListTile(
                          title: lang.submission_status,
                          trailing: status(state.submission.status),
                        ),
                        _ListTile(
                          title: lang.submission_date,
                          trailing: DateFormat.yMMMMEEEEd('id-ID')
                              .format(state.submission.createdAt),
                        ),
                        _ListTile(
                          title: lang.address,
                          trailing: state.submission.address,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SPACE_VERY_LARGE),
                  Visibility(
                    visible: state.submission.status == '2',
                    child: ElevatedButtonWidget(
                      onTap: () {
                        showConfirmationDialog(
                          context,
                          title: lang.are_you_sure_cancel_submission,
                          primaryButtonLabel: lang.yes,
                          onPrimaryButtonTap: () {
                            context.read<SubmissionCancelActorBloc>().add(
                                  SubmissionCancelActorEvent.cancel(
                                    state.submission.id,
                                  ),
                                );
                            Navigator.pop(context);
                          },
                        );
                      },
                      label: lang.cancel_submission,
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.title,
    required this.trailing,
  });

  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: SPACE_TINY,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: theme.textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: Text(
              ':',
              style: theme.textTheme.titleMedium,
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              trailing,
              style: theme.textTheme.labelMedium,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
