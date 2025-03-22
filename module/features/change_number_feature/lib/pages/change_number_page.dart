import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:change_number_feature/bloc/change_number_form/change_number_form_bloc.dart';
import 'package:change_number_feature/pages/widgets/change_number_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/timer_count_down/timer_count_down_controller.dart';
import 'package:shared_utilities/snackbar/snackbar.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class ChangeNumberPage extends StatefulWidget {
  const ChangeNumberPage({super.key});

  @override
  State<ChangeNumberPage> createState() => _ChangeNumberPageState();
}

class _ChangeNumberPageState extends State<ChangeNumberPage> {
  late final CountdownController _countdownController;
  late final TextEditingController _pinController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _countdownController = CountdownController(autoStart: true);
    _pinController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ChangeNumberFormBloc>()
          .add(const ChangeNumberFormEvent.init());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<ChangeNumberFormBloc, ChangeNumberFormState>(
      listener: (context, state) {
        if (state.state == RequestState.error) {
          if (state.message == AuthenticationException.otpInvalid) {
            final snack = showSnackbar(
              context,
              type: SnackbarType.error,
              labelText: lang.the_otp_code_you_entered_is_incorrect,
              labelButton: lang.close,
              onTap: () {},
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
          } else if (state.message == UserException.numberAlreadyRegister) {
            final snack = showSnackbar(
              context,
              type: SnackbarType.error,
              labelText: lang.number_already_registered,
              labelButton: lang.close,
              onTap: () {},
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        } else if (state.state == RequestState.loaded) {
          showToast(msg: lang.success_change_phone_number);
          context.read<AuthWatcherBloc>().add(const AuthWatcherEvent.check());
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.dashboard,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
        ),
        body: ChangeNumberBodyWidget(
          countController: _countdownController,
          pinController: _pinController,
          focusNode: _focusNode,
        ),
      ),
    );
  }
}
