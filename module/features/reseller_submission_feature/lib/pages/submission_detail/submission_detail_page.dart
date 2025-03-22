import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reseller_submission_feature/bloc/submission_cancel_actor/submission_cancel_actor_bloc.dart';
import 'package:reseller_submission_feature/bloc/submission_detail_watcher/submission_detail_watcher_bloc.dart';
import 'package:reseller_submission_feature/bloc/submission_watcher/submission_watcher_bloc.dart';
import 'package:reseller_submission_feature/pages/submission_detail/submission_detail_body_widget.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class SubmissionDetailPage extends StatefulWidget {
  const SubmissionDetailPage({required this.args, super.key});

  final int args;

  @override
  State<SubmissionDetailPage> createState() => _SubmissionDetailPageState();
}

class _SubmissionDetailPageState extends State<SubmissionDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<SubmissionDetailWatcherBloc>()
          .add(SubmissionDetailWatcherEvent.fetch(widget.args));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return MultiBlocListener(
      listeners: [
        BlocListener<SubmissionCancelActorBloc, SubmissionCancelActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              failed: (state) {
                if (state.message == UNAUTHENTICTED) {
                  showToast(
                    msg: lang.session_expired_please_login_to_continue,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.splash,
                    (route) => false,
                  );
                }
              },
              loaded: (_) {
                showToast(msg: lang.submission_canceled);
                context
                    .read<SubmissionWatcherBloc>()
                    .add(const SubmissionWatcherEvent.fetch());
                Navigator.pop(context);
              },
            );
          },
          child: Container(),
        ),
        BlocListener<SubmissionDetailWatcherBloc, SubmissionDetailWatcherState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              failed: (state) {
                if (state.message == UNAUTHENTICTED) {
                  showToast(
                    msg: lang.session_expired_please_login_to_continue,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.splash,
                    (route) => false,
                  );
                }
              },
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
        ),
        body: const SubmissionDetailBodyWidget(),
      ),
    );
  }
}
