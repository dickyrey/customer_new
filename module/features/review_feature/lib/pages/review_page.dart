import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:review_feature/bloc/review_form/review_form_bloc.dart';
import 'package:review_feature/bloc/review_transaction_watcher/review_transaction_watcher_bloc.dart';
import 'package:review_feature/pages/widgets/review_body_widget.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({
    required this.args,
    super.key,
  });

  final int args;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ReviewTransactionWatcherBloc>()
          .add(ReviewTransactionWatcherEvent.fetch(widget.args));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<ReviewFormBloc, ReviewFormState>(
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
          } else {
            Navigator.pushNamed(
              context,
              Routes.failure,
              arguments: state.message,
            );
          }
        } else if (state.state == RequestState.loaded) {
          showToast(msg: lang.thank_you_for_rating);
          Navigator.pushReplacementNamed(context, Routes.dashboard);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.cardColor,
          leading: IconButton(
            icon: const Icon(FeatherIcons.arrowLeft),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            lang.rating,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        body: ReviewBodyWidget(
          args: widget.args,
        ),
      ),
    );
  }
}
