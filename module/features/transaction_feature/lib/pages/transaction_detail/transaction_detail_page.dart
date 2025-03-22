import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:transaction_feature/bloc/transaction_cancel_actor/transaction_cancel_actor_bloc.dart';
import 'package:transaction_feature/bloc/transaction_confirm_actor/transaction_confirm_actor_bloc.dart';
import 'package:transaction_feature/bloc/transaction_detail_watcher/transaction_detail_watcher_bloc.dart';
import 'package:transaction_feature/bloc/transaction_watcher/transaction_watcher_bloc.dart';
import 'package:transaction_feature/pages/transaction_detail/widgets/transaction_detail_body_widget.dart';

class TransactionDetailPage extends StatefulWidget {
  const TransactionDetailPage({
    required this.args,
    super.key,
  });
  final int args;

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context
            .read<TransactionDetailWatcherBloc>()
            .add(TransactionDetailWatcherEvent.fetch(widget.args));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return MultiBlocListener(
      listeners: [
        BlocListener<TransactionCancelActorBloc, TransactionCancelActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              success: (value) {
                showToast(msg: lang.transaction_canceled);
                context
                    .read<TransactionWatcherBloc>()
                    .add(const TransactionWatcherEvent.fetch(0));
                Navigator.pop(context);
              },
            );
          },
        ),
        BlocListener<TransactionConfirmActorBloc, TransactionConfirmActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              error: (state) {
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
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.failure,
                    arguments: state.message,
                    (route) => false,
                  );
                }
              },
              success: (state) {
                showToast(msg: lang.order_confirmed);
                context.read<TransactionDetailWatcherBloc>().add(
                      TransactionDetailWatcherEvent.fetch(state.transaction.id),
                    );

                Navigator.pushNamed(
                  context,
                  Routes.review,
                  arguments: state.transaction.id,
                );
              },
            );
          },
        ),
        BlocListener<TransactionDetailWatcherBloc,
            TransactionDetailWatcherState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              error: (state) {
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
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.failure,
                    arguments: state.message,
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
          backgroundColor: theme.cardColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(FeatherIcons.arrowLeft),
          ),
          title: Text(
            lang.transaction_detail,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        body: const TransactionDetailBodyWidget(),
      ),
    );
  }
}
