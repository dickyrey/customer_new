import 'package:deposit_feature/bloc/deposit_top_up_form/deposit_top_up_form_bloc.dart';
import 'package:deposit_feature/bloc/deposit_watcher/deposit_watcher_bloc.dart';
import 'package:deposit_feature/pages/deposit_topup/widgets/deposit_topup_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class DepositTopupPage extends StatefulWidget {
  const DepositTopupPage({super.key});

  @override
  State<DepositTopupPage> createState() => _DepositTopupPageState();
}

class _DepositTopupPageState extends State<DepositTopupPage> {
  final TextEditingController _depositeCtrl = TextEditingController(text: '');
  final _depositList = <String>[
    '50.000',
    '100.000',
    '150.000',
    '200.000',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<DepositTopUpFormBloc, DepositTopUpFormState>(
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
          }
        } else if (state.state == RequestState.loaded) {
          context
              .read<DepositWatcherBloc>()
              .add(const DepositWatcherEvent.fetch(0));
          Navigator.pushReplacementNamed(
            context,
            Routes.depositPayment,
            arguments: state.depositDetail,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
        ),
        body: DepositTopupBodyWidget(
          depositeCtrl: _depositeCtrl,
          depositeList: _depositList,
        ),
      ),
    );
  }
}
