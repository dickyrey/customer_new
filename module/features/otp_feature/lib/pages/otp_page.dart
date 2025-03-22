import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:otp_feature/bloc/otp_form_bloc/otp_form_bloc.dart';
import 'package:otp_feature/bloc/otp_resend_actor/otp_resend_actor_bloc.dart';
import 'package:otp_feature/pages/widgets/otp_body_widget.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/timer_count_down/timer_count_down_controller.dart';
import 'package:shared_utilities/snackbar/snackbar.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({required this.phoneNumber, super.key});
  final String phoneNumber;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late final CountdownController _countdownController;
  late final TextEditingController _pinController;

  @override
  void initState() {
    super.initState();
    _countdownController = CountdownController(autoStart: true);
    _pinController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      return context.read<OtpFormBloc>().add(
            OtpFormEvent.init(
              controller: _countdownController,
              phoneNumber: widget.phoneNumber,
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return MultiBlocListener(
      listeners: [
        BlocListener<OtpFormBloc, OtpFormState>(
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
              }
            } else if (state.state == RequestState.loaded &&
                state.message == REGISTERED) {
              context
                  .read<AuthWatcherBloc>()
                  .add(const AuthWatcherEvent.check());
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.dashboard,
                (route) => false,
              );
            } else if (state.state == RequestState.loaded &&
                state.message == UNREGISTERED) {
              context
                  .read<AuthWatcherBloc>()
                  .add(const AuthWatcherEvent.check());
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.splash,
                (route) => false,
              );
            }
          },
        ),
        BlocListener<OtpResendActorBloc, OtpResendActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              failed: (state) {
                if (state.message == AuthenticationException.otpCooldown) {
                  final snack = showSnackbar(
                    context,
                    type: SnackbarType.error,
                    labelText: lang
                        //
                        // ignore: lines_longer_than_80_chars
                        .you_have_requested_an_otp_code_before_wait_about_1_minute_to_get_the_otp_code,
                    labelButton: lang.close,
                    onTap: () {},
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                }
              },
              success: (_) {
                showToast(msg: lang.new_otp_request_sent);
              },
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.cardColor,
        ),
        body: OtpBodyWidget(
          countController: _countdownController,
          pinController: _pinController,
          phoneNumber: widget.phoneNumber,
        ),
      ),
    );
  }
}
