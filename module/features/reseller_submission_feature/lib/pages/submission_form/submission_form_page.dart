import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reseller_submission_feature/bloc/submission_form/submission_form_bloc.dart';
import 'package:reseller_submission_feature/bloc/submission_watcher/submission_watcher_bloc.dart';
import 'package:reseller_submission_feature/pages/submission_form/widgets/submission_form_body_widget.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class SubmissionFormPage extends StatefulWidget {
  const SubmissionFormPage({super.key});

  @override
  State<SubmissionFormPage> createState() => _SubmissionFormPageState();
}

class _SubmissionFormPageState extends State<SubmissionFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<SubmissionFormBloc>()
          .add(const SubmissionFormEvent.fetchAddress());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<SubmissionFormBloc, SubmissionFormState>(
      listener: (context, state) {
        if (state.state == RequestState.error) {
          if (state.message == UNAUTHENTICTED) {
            showToast(
              msg: lang.session_expired_please_login_to_continue,
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.splash,
              (route) => false,
            );
          } else if (state.message == ResellerException.underReview) {
            showToast(
              msg: lang.cannot_submit_new_application_processing,
              backgroundColor: theme.colorScheme.error,
            );
            Navigator.pop(context);
          } else {
            Navigator.pushNamed(
              context,
              Routes.failure,
              arguments: state.message,
            );
          }
        } else if (state.state == RequestState.loaded) {
          context
              .read<SubmissionWatcherBloc>()
              .add(const SubmissionWatcherEvent.fetch());
          showToast(msg: lang.successfull_sended);
          Navigator.pop(context);
        }
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
        body: SubmissionFormBodyWidget(
          formKey: _formKey,
        ),
      ),
    );
  }
}
