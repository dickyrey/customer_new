import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reseller_submission_feature/bloc/submission_watcher/submission_watcher_bloc.dart';
import 'package:reseller_submission_feature/pages/submission_overview/widgets/submission_overview_body_widget.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class SubmissionOverviewPage extends StatefulWidget {
  const SubmissionOverviewPage({super.key});

  @override
  State<SubmissionOverviewPage> createState() => _SubmissionOverviewPageState();
}

class _SubmissionOverviewPageState extends State<SubmissionOverviewPage> {
  late ScrollController _controller;
  bool _hasReachedMax = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
        if (_hasReachedMax == false) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<SubmissionWatcherBloc>().add(
                  const SubmissionWatcherEvent.next(),
                );
          });
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<SubmissionWatcherBloc>()
          .add(const SubmissionWatcherEvent.fetch());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<SubmissionWatcherBloc, SubmissionWatcherState>(
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
          loaded: (state) {
            if (state.hasReachedMax) {
              setState(() {
                _hasReachedMax = state.hasReachedMax;
              });
            }
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.cardColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(FeatherIcons.arrowLeft),
          ),
          title: Text(
            lang.submission,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        body: SubmissionOverviewBodyWidget(
          controller: _controller,
          hasReachedMax: _hasReachedMax,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.submissionForm,
            );
          },
          child: const Icon(
            FeatherIcons.plus,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
