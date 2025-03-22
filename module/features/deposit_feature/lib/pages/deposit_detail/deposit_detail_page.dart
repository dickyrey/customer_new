import 'package:deposit_feature/bloc/deposit_cancel_actor/deposit_cancel_actor_bloc.dart';
import 'package:deposit_feature/bloc/deposit_detail_watcher/deposit_detail_watcher_bloc.dart';
import 'package:deposit_feature/bloc/deposit_watcher/deposit_watcher_bloc.dart';
import 'package:deposit_feature/pages/deposit_detail/widgets/deposit_detail_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class DepositDetailPage extends StatefulWidget {
  const DepositDetailPage({required this.args, super.key});
  final int args;

  @override
  State<DepositDetailPage> createState() => _DepositDetailPageState();
}

class _DepositDetailPageState extends State<DepositDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context
            .read<DepositDetailWatcherBloc>()
            .add(DepositDetailWatcherEvent.fetch(widget.args));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return MultiBlocListener(
      listeners: [
        BlocListener<DepositCancelActorBloc, DepositCancelActorState>(
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
                }
              },
              success: (_) {
                showToast(msg: lang.transaction_canceled);
                context
                    .read<DepositWatcherBloc>()
                    .add(const DepositWatcherEvent.fetch(0));
                Navigator.pop(context);
              },
            );
          },
        ),
        BlocListener<DepositDetailWatcherBloc, DepositDetailWatcherState>(
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
        body: const DepositDetailBodyWidget(),
      ),
    );
  }
}
